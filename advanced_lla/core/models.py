import json
import os
from datetime import datetime
from dataclasses import dataclass, asdict, field
from typing import List, Optional, Dict

@dataclass
class Command:
    name: str
    category: str
    tags: List[str]
    difficulty: str
    description: str
    examples: List[str] = field(default_factory=list)
    bookmarked: bool = False

@dataclass
class LogEntry:
    timestamp: str
    command: str
    exit_status: int
    duration: float
    working_dir: str
    session_id: str
    notes: Optional[str] = None
    context: Dict = field(default_factory=dict)

class DataManager:
    def __init__(self, data_dir: str):
        self.data_dir = data_dir
        self.commands_path = os.path.join(data_dir, "commands.json")
        self.logs_path = os.path.join(data_dir, "logs.json")
        self.profile_path = os.path.join(data_dir, "profile.json")
        self._ensure_files()

    def _ensure_files(self):
        if not os.path.exists(self.commands_path):
            self.save_json(self.commands_path, [])
        if not os.path.exists(self.logs_path):
            self.save_json(self.logs_path, [])
        if not os.path.exists(self.profile_path):
            self.save_json(self.profile_path, {"name": "User", "level": "Beginner", "joined": datetime.now().isoformat()})

    def save_json(self, path, data):
        with open(path, 'w') as f:
            json.dump(data, f, indent=4)

    def load_json(self, path):
        with open(path, 'r') as f:
            return json.load(f)

    def add_log(self, entry: LogEntry):
        logs = self.load_json(self.logs_path)
        logs.append(asdict(entry))
        self.save_json(self.logs_path, logs)

    def get_commands(self) -> List[Command]:
        data = self.load_json(self.commands_path)
        return [Command(**c) for c in data]

    def add_command(self, cmd: Command):
        cmds = self.load_json(self.commands_path)
        cmds.append(asdict(cmd))
        self.save_json(self.commands_path, cmds)

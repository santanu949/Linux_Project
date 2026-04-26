import subprocess
import os
from datetime import datetime

class AutomationManager:
    def __init__(self, project_root):
        self.root = project_root

    def git_auto_commit(self, message=None):
        if not message:
            message = f"LLA Auto-Sync: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
        
        try:
            subprocess.run(['git', 'add', '.'], cwd=self.root)
            subprocess.run(['git', 'commit', '-m', message], cwd=self.root)
            print("Successfully committed changes.")
        except Exception as e:
            print(f"Git auto-commit failed: {e}")

    def is_destructive(self, command):
        dangerous_patterns = ['rm -rf /', 'rm -rf *', 'mkfs', 'dd if=', '> /dev/sda']
        return any(p in command for p in dangerous_patterns)

    def generate_markdown_diary(self, dm):
        report_path = os.path.join(self.root, 'reports/tech_diary.md')
        profile = dm.load_json(dm.profile_path)
        cmds = dm.get_commands()
        logs = dm.load_json(dm.logs_path)

        with open(report_path, 'w') as f:
            f.write(f"# {profile.get('name')}'s Linux Learning Diary\n\n")
            f.write(f"Level: {profile.get('level')}\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            
            f.write("## 📚 Mastered Commands\n")
            for c in cmds:
                f.write(f"### {c.name}\n- Category: {c.category}\n- Description: {c.description}\n\n")
            
            f.write("## 🕒 Recent Activity\n")
            for l in logs[-10:]:
                status = "✅" if l['exit_status'] == 0 else "❌"
                f.write(f"- `{l['command']}` {status} ({l['timestamp']})\n")
        
        print(f"Markdown diary generated at {report_path}")

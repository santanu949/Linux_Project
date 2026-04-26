import sys
import os
from datetime import datetime
import uuid

# Add core to path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from core.models import DataManager, LogEntry
from core.automation import AutomationManager

def main():
    if len(sys.argv) < 5:
        return

    cmd = sys.argv[1]
    status = int(sys.argv[2])
    duration = float(sys.argv[3])
    pwd = sys.argv[4]
    
    data_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../data'))
    project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../..'))
    dm = DataManager(data_dir)
    automation = AutomationManager(project_root)
    
    # Get current session ID from temp file or env
    session_id = os.getenv('LLA_SESSION_ID', str(uuid.uuid4())[:8])
    
    # Safety Check
    is_dangerous = automation.is_destructive(cmd)
    
    entry = LogEntry(
        timestamp=datetime.now().isoformat(),
        command=cmd,
        exit_status=status,
        duration=duration,
        working_dir=pwd,
        session_id=session_id,
        context={"is_dangerous": is_dangerous}
    )
    
    dm.add_log(entry)

if __name__ == "__main__":
    main()

from collections import Counter
from datetime import datetime
import json
import os

class AnalyticsEngine:
    def __init__(self, data_manager):
        self.dm = data_manager

    def get_usage_stats(self):
        logs = self.dm.load_json(self.dm.logs_path)
        if not logs:
            return {}

        commands = [l['command'] for l in logs]
        counts = Counter(commands)
        
        success_count = sum(1 for l in logs if l['exit_status'] == 0)
        failure_count = len(logs) - success_count
        
        return {
            "top_commands": counts.most_common(5),
            "success_rate": round(success_count / len(logs) * 100, 2) if logs else 0,
            "total_executions": len(logs),
            "failure_ratio": round(failure_count / len(logs), 2) if logs else 0
        }

    def get_recommendations(self):
        logs = self.dm.load_json(self.dm.logs_path)
        all_cmds = self.dm.get_commands()
        
        practiced = set(l['command'] for l in logs)
        
        # Simple rule: suggest commands in current level not yet practiced
        profile = self.dm.load_json(self.dm.profile_path)
        current_level = profile.get('level', 'Beginner')
        
        recommendations = [
            c for c in all_cmds 
            if c.difficulty == current_level and c.name not in practiced
        ]
        
        return recommendations[:5]

    def get_streak(self):
        logs = self.dm.load_json(self.dm.logs_path)
        if not logs:
            return 0
            
        dates = sorted(set(l['timestamp'].split('T')[0] for l in logs), reverse=True)
        # Simplified streak calculation
        return len(dates) # Placeholder for actual daily streak logic

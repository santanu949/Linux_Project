import sys
import os
import subprocess
import json
from datetime import datetime

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from core.models import DataManager, Command
from core.analytics import AnalyticsEngine

class LLA_CLI:
    def __init__(self):
        self.data_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../data'))
        self.dm = DataManager(self.data_dir)
        self.analytics = AnalyticsEngine(self.dm)

    def menu(self):
        options = [
            "1. Search Command Palette (fzf)",
            "2. View Analytics Dashboard",
            "3. Get Recommendations",
            "4. Generate Progress Report",
            "5. Open Web Dashboard",
            "6. Backup & Sync (Git)",
            "q. Exit"
        ]
        
        while True:
            os.system('clear')
            print("==========================================")
            print("     ADVANCED LINUX LEARNING ASSISTANT    ")
            print("==========================================")
            for opt in options:
                print(opt)
            
            choice = input("\nSelect an option: ")
            
            if choice == '1': self.search_palette()
            elif choice == '2': self.show_stats()
            elif choice == '3': self.recommend()
            elif choice == '4': self.generate_report()
            elif choice == '5': self.start_web()
            elif choice == '6': self.sync()
            elif choice == 'q': break

    def search_palette(self):
        cmds = self.dm.get_commands()
        cmd_strings = [f"{c.name} | {c.category} | {c.description}" for c in cmds]
        
        # Use fzf for interactive selection
        try:
            process = subprocess.Popen(
                ['fzf', '--header', 'Search Commands (Enter to view details)'],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            stdout, _ = process.communicate(input="\n".join(cmd_strings))
            
            if stdout:
                selected_name = stdout.split('|')[0].strip()
                self.view_command_details(selected_name)
        except FileNotFoundError:
            print("fzf not found. Please install fzf for the interactive palette.")
            input("Press Enter to continue...")

    def view_command_details(self, name):
        cmds = self.dm.get_commands()
        cmd = next((c for c in cmds if c.name == name), None)
        if cmd:
            print(f"\n--- {cmd.name} ---")
            print(f"Category: {cmd.category}")
            print(f"Difficulty: {cmd.difficulty}")
            print(f"Description: {cmd.description}")
            print(f"Tags: {', '.join(cmd.tags)}")
            input("\nPress Enter to return...")

    def show_stats(self):
        stats = self.analytics.get_usage_stats()
        print("\n--- Analytics Summary ---")
        print(f"Total Executions: {stats.get('total_executions')}")
        print(f"Success Rate: {stats.get('success_rate')}%")
        print("\nTop Commands:")
        for cmd, count in stats.get('top_commands', []):
            print(f"- {cmd}: {count} times")
        input("\nPress Enter to return...")

    def recommend(self):
        recs = self.analytics.get_recommendations()
        print("\n--- Intelligent Recommendations ---")
        for r in recs:
            print(f"- {r.name} ({r.difficulty}): {r.description}")
        input("\nPress Enter to return...")

    def start_web(self):
        print("Starting Web Dashboard on http://localhost:5000...")
        subprocess.Popen(['python3', os.path.join(os.path.dirname(__file__), '../web/app.py')])
        input("Press Enter to return to CLI (Web server running in background)...")

if __name__ == "__main__":
    cli = LLA_CLI()
    if len(sys.argv) > 1:
        # Handle subcommands if needed
        pass
    else:
        cli.menu()

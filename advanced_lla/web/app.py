from flask import Flask, render_template, jsonify
import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from core.models import DataManager
from core.analytics import AnalyticsEngine

app = Flask(__name__)
data_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../data'))
dm = DataManager(data_dir)
analytics = AnalyticsEngine(dm)

@app.route('/')
def index():
    return """
    <html>
        <head>
            <title>LLA Dashboard</title>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <style>
                body { font-family: sans-serif; background: #1a1a1a; color: white; padding: 20px; }
                .card { background: #2d2d2d; padding: 20px; border-radius: 8px; margin: 10px; display: inline-block; min-width: 200px; }
                h1 { color: #00ff00; }
            </style>
        </head>
        <body>
            <h1>Linux Learning Assistant Dashboard</h1>
            <div id="stats"></div>
            <canvas id="usageChart" width="400" height="200"></canvas>
            <script>
                fetch('/api/stats').then(r => r.json()).then(data => {
                    const ctx = document.getElementById('usageChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: data.top_commands.map(c => c[0]),
                            datasets: [{
                                label: 'Command Frequency',
                                data: data.top_commands.map(c => c[1]),
                                backgroundColor: '#00ff00'
                            }]
                        }
                    });
                });
            </script>
        </body>
    </html>
    """

@app.route('/api/stats')
def get_stats():
    return jsonify(analytics.get_usage_stats())

if __name__ == "__main__":
    app.run(port=5000)

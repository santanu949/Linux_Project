<<<<<<< HEAD
# 🐧 Linux Learning Assistant (LLA) v3.0 - Production Grade

![Linux](https://img.shields.io/badge/OS-Linux-orange?logo=linux)
![Python](https://img.shields.io/badge/Language-Python%203.8+-blue?logo=python)
![Bash](https://img.shields.io/badge/Scripting-Bash-green?logo=gnu-bash)
![Flask](https://img.shields.io/badge/Web-Flask-lightgrey?logo=flask)
![License](https://img.shields.io/badge/License-MIT-green)

An intelligent, automation-driven, and data-centric terminal ecosystem designed to transform the standard Linux tech diary into a professional mastery tool.

---

## 📖 Overview

### The Real-World Problem
For students and aspiring system administrators, mastering the Linux terminal often feels like a fragmented experience. Command history is fleeting, personal notes are disconnected from actual execution, and there is no structured way to track skill progression or receive context-aware recommendations.

### The Solution: LLA v3.0
The **Linux Learning Assistant (LLA)** bridge this gap by creating a unified layer between the user and the shell. It doesn't just log commands; it analyzes execution metadata, monitors safety, generates visual insights, and provides an adaptive learning path. It transforms a static diary into a "living" assistant that grows with the user.

---

## 🚀 Key Features

### 💻 Core Interaction (Software)
- **Interactive Fuzzy Palette**: Search through hundreds of commands and logs instantly using `fzf`.
- **Intelligent Logging Engine**: Captures exit codes, execution duration, PWD, and session context automatically via shell hooks.
- **Adaptive Recommendations**: Suggests advanced alternatives and new commands based on current usage gaps.

### 📊 Analytics & Automation
- **Real-Time Visualization**: A lightweight web dashboard for usage heatmaps and mastery streaks.
- **Auto-Diary Generation**: One-click generation of polished Markdown reports and tech diaries.
- **Git Mastery Sync**: Automated version control of your learning progress with structured commit messages.

### 🛡️ Safety & Reliability
- **Destructive Command Guard**: Regex-based detection of dangerous commands (e.g., `rm -rf /`) with immediate flagging.
- **Data Integrity**: JSON-based structured storage with validation to prevent corruption.

---

## 🏗️ System Architecture

The LLA operates on a layered architecture to ensure modularity and scalability:

1.  **Capture Layer (Shell Hooks)**: Intercepts terminal events and gathers high-fidelity metadata.
2.  **Data Layer (JSON Storage)**: Stores commands, logs, and profiles in a structured, queryable format.
3.  **Core Logic (Python Engines)**: Processes raw data for analytics, safety checks, and recommendations.
4.  **Presentation Layer (CLI & Web)**: Provides user interfaces via a high-performance CLI (Python/fzf) and a visualization dashboard (Flask/JS).

```mermaid
graph TD
    A[User Terminal] -->|Command Execution| B(Shell Hook)
    B -->|Metadata| C(Log Backend)
    C -->|Structured JSON| D[Data Layer]
    D <-->|Query/Update| E(Analytics Engine)
    E -->|Insights| F[CLI Assistant]
    E -->|Stats| G[Web Dashboard]
    F -->|User Interaction| A
```

---

## 🛠️ Tech Stack

| Layer | Technologies |
| :--- | :--- |
| **Core Logic** | Python 3.8+, Dataclasses, JSON |
| **CLI Framework** | Bash, Python (Subprocess), fzf |
| **Web Dashboard** | Flask, Chart.js, HTML5/CSS3 |
| **Automation** | Git, Shell Scripting, Cron |
| **Data Storage** | Structured JSON |

---

## ⚙️ Setup and Installation

### Prerequisites
- **Python 3.8+** and **pip**
- **fzf** (Fuzzy Finder)
- **Git**

### Step-by-Step Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/santanu949/Linux_Project.git
   cd Linux_Project
   ```

2. **Run the Installer**:
   ```bash
   chmod +x advanced_lla/setup.sh
   ./advanced_lla/setup.sh
   ```

3. **Configure Your Shell**:
   Add the following line to your `~/.bashrc` or `~/.zshrc`:
   ```bash
   source $(pwd)/advanced_lla/shell/hook.sh
   ```

4. **Reload Shell**:
   ```bash
   source ~/.bashrc
   ```

---

## 📖 Usage Guide

### 1. Daily Interaction
Simply use your terminal as usual. The LLA shell hook runs in the background, logging your progress and checking for safety.

### 2. The Assistant CLI
Type `lla` to open the interactive menu. From here you can:
- **Search Palette**: Find commands and view their documentation.
- **View Stats**: Check your success ratios and top commands.
- **Get Recommendations**: See what the AI suggests you learn next.

### 3. Visual Dashboard
Launch the dashboard via the `lla` menu or directly:
```bash
python3 advanced_lla/web/app.py
```
Open `http://localhost:5000` in your browser.

---

## 📂 Project Structure

```text
advanced_lla/
├── bin/          # Executable entry points (CLI, Loggers)
├── core/         # Business logic (Analytics, Models, Automation)
├── shell/        # Shell hooks (Bash/Zsh integration)
├── data/         # Structured JSON storage (commands.json, logs.json)
├── web/          # Flask web dashboard and static assets
├── reports/      # Auto-generated MD/HTML reports
└── setup.sh      # Production-grade installer
```

---

## 📈 Current Status
- **Current Version**: v3.0 (Production-Grade)
- **Status**: Stable
- **Roadmap**: Plugin API enhancement, Zsh-native completions, and Cloud-sync support.

---

## 👥 Contributors
- **Santanu Biswajit Samanta** - *Lead Developer & Architect*

---
*Developed with ❤️ for the Linux Community.*
=======

# 🐧 Linux Fundamentals Tech Diary
![Linux](https://img.shields.io/badge/OS-Linux-informational?style=flat&logo=linux&logoColor=white&color=FCC624)
![Shell](https://img.shields.io/badge/Shell-Bash-informational?style=flat&logo=gnu-bash&logoColor=white&color=4EAA25)
![Status](https://img.shields.io/badge/Status-Completed-success?style=flat)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat)
> A hands-on Linux learning diary documenting personal profile, favourite shell commands, and a live command execution log — built as part of a Linux Fundamentals bootcamp.
---
## 📖 Overview
### The Problem
Beginners learning Linux often struggle to retain knowledge of essential shell commands and lack a structured way to document their practice sessions. Without a personal reference, repetitive lookup of basic commands slows the learning process and reduces confidence.
### The Solution
This project provides a **personal tech diary** that centralises three core learning artefacts:
1. A **profile** capturing the learner's identity.
2. A curated **commands reference** with plain-English explanations.
3. A **live log** of the last commands actually executed, reinforcing learning through reflection.
All artefacts are plain-text files maintained inside a zip archive, making the diary fully portable and reproducible on any Linux system.
---
## ✨ Key Features
### 📁 Documentation
- **Personal Profile** — name, roll number, and institution details stored in `profile.txt`.
- **Command Reference** — a hand-picked list of the most-used Linux commands with concise explanations in `commands.txt`.
- **Execution Log** — a trimmed history of the last 5 commands run, automatically captured in `log.txt`.
- **Consolidated Tech Diary** — `tech_diary.txt` aggregates all three sources into one readable document with a motivational closing quote.
### 🛠️ Workflow
- All files are created and edited directly from the Linux terminal using core shell commands.
- The history log is generated programmatically with `history | tail -5 >> log.txt`, demonstrating real shell scripting in action.
- The entire project directory is packaged as a `.zip` archive for portability.
---
## 🏗️ System Architecture
```
linux_project2/
│
├── profile.txt       ← Learner identity (name, roll no., college)
├── commands.txt      ← Favourite Linux commands + descriptions
├── log.txt           ← Last 5 executed commands (auto-captured)
└── tech_diary.txt    ← Master diary: aggregates all above + quote
```
**Data Flow:**
```
Terminal Session
      │
      ├─── touch / vim / nano ──► profile.txt
      ├─── touch / vim / nano ──► commands.txt
      ├─── history | tail -5  ──► log.txt
      └─── cat (all files)    ──► tech_diary.txt
                                        │
                                   zip archive
                                  (linux_project2.zip)
```
---
## 🧰 Tech Stack
| Layer | Tool / Technology |
|---|---|
| Operating System | Linux (any distro) |
| Shell | Bash |
| Text Editors | `vim`, `nano` |
| File Management | `touch`, `mkdir`, `rm`, `cat` |
| Archiving | `zip` |
| Version Control | Git / GitHub |
---
## ⚙️ Setup & Installation
### Prerequisites
- A Linux environment (native, WSL, or a virtual machine).
- `git` and `unzip` installed.
### Steps
```bash
# 1. Clone the repository
git clone https://github.com/santanu949/Linux_Project.git
cd Linux_Project
# 2. Extract the project archive
unzip linux_project2.zip
# 3. Navigate into the project directory
cd linux_project2
# 4. Verify the files are present
ls -lh
```
Expected output:
```
commands.txt
log.txt
profile.txt
tech_diary.txt
```
---
## 🚀 Usage Guide
### View the Tech Diary
```bash
cat tech_diary.txt
```
### View individual files
```bash
# Personal profile
cat profile.txt
# Favourite commands reference
cat commands.txt
# Command execution log
cat log.txt
```
### Update the execution log
```bash
# Append the last 5 commands from your current session to log.txt
history | tail -5 >> log.txt
```
### Edit a file
```bash
# Using vim
vim commands.txt
# Using nano
nano commands.txt
```
### Re-package into an archive
```bash
cd ..
zip -r linux_project2.zip linux_project2/
```
---
## 📂 Project Structure
```
Linux_Project/
├── README.md              ← Project documentation (this file)
└── linux_project2.zip     ← Portable archive containing:
    └── linux_project2/
        ├── profile.txt    ← Personal profile
        ├── commands.txt   ← Favourite Linux commands
        ├── log.txt        ← Last 5 commands executed
        └── tech_diary.txt ← Full consolidated diary
```
---
## 📊 Current Status
| Feature | Status |
|---|---|
| Personal profile file | ✅ Complete |
| Favourite commands reference | ✅ Complete |
| Command execution log | ✅ Complete |
| Tech diary consolidation | ✅ Complete |
| GitHub repository setup | ✅ Complete |
| Extended command set | 🔄 Planned |
| Shell script automation | 🔄 Planned |
---
## 👤 Contributors
| Name | Role | Institution |
|---|---|---|
| **Santanu Biswajit Samanta** | Author & Maintainer | Amity University, Mumbai |

>>>>>>> f62972e83650c287edd9ac3b3e716efafdd1eead

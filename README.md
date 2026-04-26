Rewrite README.md with full structured narrative:
 Project identity (title, badges, description)
 Overview (problem statement, core idea)
 Key features
 System architecture / workflow
 Tech stack
 Setup & installation
 Usage guide
 Project structure
 Current status
 Contributors
Output
$ git push -v origin copilot/add-structured-readme
Pushing to https://github.com/santanu949/Linux_Project
To https://github.com/santanu949/Linux_Project
 = [up to date]      copilot/add-structured-readme -> copilot/add-structured-readme
updating local tracking ref 'refs/remotes/origin/copilot/add-structured-readme'
Everything up-to-date



Progress reported successfully.

Edit README.md
Original file line number	Diff line number	Diff line change
# Linux_Project
This repository contains my Linux Fundamentals Tech Diary project. It includes my personal profile, my favorite Linux commands with explanations, and a log of commands I executed. The project is designed to practice basic Linux commands and is neatly documented and organized. This is part of a hands-on Linux learning bootcamp.
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
| **Santanu Biswajit Samanta** | Author & Maintainer | Amity University, Mumbai (Roll No. 65) |
---
> *"Growing with pride. Happy learning."* 🚀

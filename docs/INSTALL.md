# Installation Guide

## Prerequisites

### Install Taskwarrior

**macOS (Homebrew):**
```bash
brew install task
```

**Ubuntu/Debian:**
```bash
sudo apt install taskwarrior
```

**Fedora:**
```bash
sudo dnf install task
```

**Arch Linux:**
```bash
sudo pacman -S task
```

## Install Tax Tasks Script

### Option 1: Clone Repository

```bash
git clone https://github.com/bgs-fbreen/tax-tasks.git
cd tax-tasks
chmod +x tax_tasks_setup. sh
```

### Option 2: Download Script Only

```bash
curl -O https://raw.githubusercontent.com/bgs-fbreen/tax-tasks/main/tax_tasks_setup.sh
chmod +x tax_tasks_setup.sh
```

## Initial Setup

### 1. Run the Script

```bash
./tax_tasks_setup.sh
```

### 2. Configure Taskwarrior (Optional)

From the main menu, press `x` to permanently remove the Age column from reports.

### 3. Create Tasks

Choose one of these options from the menu:
- **Option 1**: Single tax year
- **Option 2**: Range of years
- **Option 3**: From a specific start date (recommended)
- **Option 4**: Current tax year (auto-detect)
- **Option 5**: Create for 2024, 2025, and 2026

### Recommended First Run

```
Choose option 3
Enter start date: 2025-01-01
Enter number of years: 2
```

This creates all tasks for tax years 2025 and 2026 with due dates on or after January 1, 2025. 

## Verify Installation

```bash
# Check tasks were created
task project:acc.tax count

# List all tax tasks
task project:acc.tax list

# Search by tax year
task +ty2025 list
```

## Troubleshooting

### Clear and Restart

If tasks were created incorrectly:

```bash
# Remove Taskwarrior database
rm ~/. task/taskchampion.sqlite3

# Re-run script
./tax_tasks_setup. sh
```

### Fix Spacing Issues

If the script has `.  ` (dot-space) issues:

```bash
sed -i 's/\. /./g' tax_tasks_setup. sh
```

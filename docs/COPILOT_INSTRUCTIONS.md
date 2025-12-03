# Copilot Integration Instructions

This document provides instructions for integrating the Tax Tasks system with a Python-based Copilot accounting assistant.

## Overview

The tax task system uses Taskwarrior to manage deadlines.  You can query and manage tasks via command line, which can be integrated into a Python assistant.

## Python Integration

### Query Tasks

```python
import subprocess
import json

def get_tax_tasks(filter_query=""):
    """Get tax tasks as JSON"""
    cmd = f"task project:acc.tax {filter_query} export"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return json.loads(result.stdout)

def get_overdue_tasks():
    """Get overdue tax tasks"""
    return get_tax_tasks("+OVERDUE")

def get_due_this_week():
    """Get tasks due this week"""
    return get_tax_tasks("due.before:eow status:pending")

def get_tasks_by_entity(entity):
    """Get tasks for specific entity: personal, bgs, mhb"""
    return get_tax_tasks(f"+{entity}")

def get_tasks_by_year(year):
    """Get tasks for specific tax year"""
    return get_tax_tasks(f"+ty{year}")
```

### Complete Tasks

```python
def complete_task(task_id, note=None):
    """Mark a task as complete with optional note"""
    if note:
        subprocess.run(f'task {task_id} annotate "{note}"', shell=True)
    subprocess.run(f'task {task_id} done', shell=True)
```

### Example Copilot Prompts

When user asks about taxes, query Taskwarrior:

```python
# "What tax deadlines do I have this month?"
tasks = get_tax_tasks("due.before:eom status:pending")

# "Show me all Q4 estimated payments"
tasks = get_tax_tasks("+Q4 +estimated")

# "What's overdue for BGS?"
tasks = get_tax_tasks("+bgs +OVERDUE")

# "Mark the Michigan FTE Q4 payment as complete"
# First find the task, then complete it
tasks = get_tax_tasks("+FTE +Q4 +ty2025")
if tasks:
    complete_task(tasks[0]['id'], "Paid $X via MI Treasury")
```

## Suggested Copilot Commands

| User Says | Action |
|-----------|--------|
| "What taxes are due?" | `get_due_this_week()` |
| "Show overdue tasks" | `get_overdue_tasks()` |
| "BGS tax status" | `get_tasks_by_entity("bgs")` |
| "2025 tax tasks" | `get_tasks_by_year(2025)` |
| "Mark task 14 complete" | `complete_task(14, note)` |
| "Property tax status" | `get_tax_tasks("+propertytax")` |
| "941 filing status" | `get_tax_tasks("+form941")` |

## Data Files

- **Taskwarrior DB**: `~/.task/taskchampion.sqlite3`
- **Payment Tracker**: `~/.tax_payments_tracker.csv`

## Payment Tracker CSV Format

```csv
date,tax_year,entity,payment_type,quarter,amount,confirmation,method,notes
2025-04-15,2025,Personal,Federal_Estimated_1040ES,Q1,5000.00,EFT123456,EFTPS,Q1 payment
```

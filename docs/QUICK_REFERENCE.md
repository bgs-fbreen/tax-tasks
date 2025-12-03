# Quick Reference

## Command Line Examples

### View Tasks

```bash
# All tax tasks
task project:acc.tax list

# By tax year
task +ty2025 list
task +ty2026 list

# By entity
task +personal list
task +bgs list
task +mhb list

# By property
task +905brown list
task +711pine list
task +819helen list

# By quarter
task +Q1 list
task +Q2 list
task +Q3 list
task +Q4 list

# By form type
task +form941 list
task +UIA list
task +form1040 list
task +estimated list
```

### Due Date Filters

```bash
# Overdue
task project:acc.tax +OVERDUE list

# Due today
task project:acc.tax due:today list

# Due this week
task project:acc.tax due. before:eow list

# Due this month
task project:acc. tax due.before:eom list

# Due in next 30 days
task project:acc. tax due.before:30d list
```

### Manage Tasks

```bash
# Complete a task
task <ID> done

# Add annotation
task <ID> annotate "Paid via EFTPS, confirmation #12345"

# View task details
task <ID> info

# Edit task
task <ID> edit

# Delete task
task <ID> delete
```

### Combined Filters

```bash
# Q4 estimated payments for 2025
task +ty2025 +Q4 +estimated list

# BGS payroll taxes
task +bgs +form941 list

# MHB property taxes
task +mhb +propertytax list

# Personal federal taxes due this month
task +personal +federal due.before:eom list
```

## Script Menu Options

| Key | Action |
|-----|--------|
| 1 | Create tasks for single tax year |
| 2 | Create tasks for range of years |
| 3 | Create tasks from specific start date |
| 4 | Create tasks for current tax year |
| 5 | Create tasks for 2024, 2025, 2026 |
| 6 | Search tasks |
| 7 | Quick search presets |
| 8 | View task summary |
| 9 | Help |
| c | Complete a task |
| a | Add annotation |
| v | View task details |
| d | Dashboard |
| p | Payment tracker |
| r | Reports |
| x | Configure Taskwarrior |
| q | Quit |

## Tax Deadlines Reference

### Federal Estimated (1040-ES)
- Q1: April 15
- Q2: June 15
- Q3: September 15
- Q4: January 15 (following year)

### Michigan Estimated (MI-1040ES)
- Same as federal

### Michigan FTE (Form 5778)
- Q1: April 15
- Q2: June 15
- Q3: September 15
- Q4: December 15

### Form 941 (Quarterly Payroll)
- Q1: April 30
- Q2: July 31
- Q3: October 31
- Q4: January 31 (following year)

### Michigan UIA
- Same as Form 941

### Annual Returns
- S-Corp (1120-S): March 15
- Partnership (1065): March 15
- Personal (1040): April 15
- Michigan FTE (5774): March 31

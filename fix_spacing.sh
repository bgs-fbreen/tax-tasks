#!/bin/bash
# Fix spacing issues in tax_tasks_setup.sh
# Run this if you have ".  " (dot-space) problems

sed -i 's/\. /./g' tax_tasks_setup.sh
echo "Fixed spacing issues in tax_tasks_setup.sh"

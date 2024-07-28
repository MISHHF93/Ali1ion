#!/bin/bash

# Trace script to log information

# Log the current date and time
echo "Current Date and Time: $(date)"

# Log the current user
echo "Current User: $(whoami)"

# Log the current directory
echo "Current Directory: $(pwd)"

# Log the system uptime
echo "System Uptime: $(uptime -p)"

# Log the disk usage
echo "Disk Usage:"
df -h

# Log the memory usage
echo "Memory Usage:"
free -h

# Log the environment variables
echo "Environment Variables:"
printenv


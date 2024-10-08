#!/bin/bash

# Script to clean up and install correct versions of dependencies

# Function to check and ensure that the script is run from the right directory
check_directory() {
    if [ ! -f "package.json" ]; then
        echo "ERROR: This script must be run from the project's root directory containing 'package.json'."
        exit 1
    fi
}

# Function to delete node_modules and package-lock.json
clean_dependencies() {
    echo "Cleaning up existing dependencies..."
    if [ -d "node_modules" ]; then
        rm -rf node_modules
        echo "Deleted node_modules directory."
    else
        echo "No node_modules directory found."
    fi

    if [ -f "package-lock.json" ]; then
        rm package-lock.json
        echo "Deleted package-lock.json file."
    else
        echo "No package-lock.json file found."
    fi
}

# Function to reinstall packages with legacy peer dependencies handling
install_dependencies() {
    echo "Reinstalling dependencies with --legacy-peer-deps option..."
    npm install --legacy-peer-deps
    if [ $? -ne 0 ]; then
        echo "ERROR: npm install failed. Please check your package.json for issues."
        exit 1
    else
        echo "Dependencies installed successfully."
    fi
}

# Function to run npm audit and fix vulnerabilities cautiously
audit_and_fix_vulnerabilities() {
    echo "Running npm audit to identify vulnerabilities..."
    npm audit

    echo "Fixing vulnerabilities automatically..."
    npm audit fix

    echo "Force fixing remaining vulnerabilities..."
    npm audit fix --force

    echo "Vulnerability resolution complete. Please verify critical issues manually if any remain."
}

# Main function to orchestrate steps
main() {
    check_directory
    clean_dependencies
    install_dependencies
    audit_and_fix_vulnerabilities
    echo "Dependency cleanup and installation process completed."
}

# Run the main function
main

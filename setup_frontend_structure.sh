#!/bin/bash

# Create directories for frontend structure
mkdir -p frontend/src/assets/css
mkdir -p frontend/src/components/VoiceChat
mkdir -p frontend/src/containers/VoiceChat
mkdir -p frontend/src/pages/Home
mkdir -p frontend/src/pages/VoiceChat

# Create README for documentation (optional)
touch frontend/src/components/VoiceChat/README.md

# Create CSS and JS files for voice chat
touch frontend/src/components/VoiceChat/voicechat.css
touch frontend/src/components/VoiceChat/voicechat.js

# Add HTML file to VoiceChat or Home page
touch frontend/src/pages/VoiceChat/index.html
touch frontend/src/pages/Home/index.html

# Display success message
echo "Frontend structure for Ali1ion voice chat hologram created successfully!"

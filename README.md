# Pwn Request Vulnerability Demo

This demo shows how pwn request attacks work and how to fix them.

## Setup Instructions

1. **Create a new GitHub repository** (public or private)
2. **Copy the files from this demo** to your repository
3. **Follow the attack simulation steps**
4. **Apply the fixes and see the difference**

## Demo Structure

```
pwn-request-demo/
├── .github/workflows/
│   ├── vulnerable.yml      # Vulnerable workflow
│   ├── secure.yml          # Fixed workflow
│   └── detection.yml       # Vulnerability scanner
├── attack-simulation/
│   ├── malicious-package.json
│   ├── evil-script.sh
│   └── attack-steps.md
├── package.json            # Legitimate package file
└── README.md              # This file
```

## Quick Start

1. Push the vulnerable workflow to your repo
2. Create a fork and malicious PR (following attack-steps.md)
3. Watch the vulnerability in action
4. Replace with secure workflow
5. Test that the attack no longer works

## Learning Objectives

- Understand how pwn requests work
- See real attack scenarios
- Learn to identify vulnerable patterns
- Practice implementing secure fixes

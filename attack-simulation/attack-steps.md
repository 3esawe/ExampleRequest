# Attack Simulation Steps

Follow these steps to simulate a pwn request attack safely.

## Prerequisites

1. Create a GitHub repository with the vulnerable workflow
2. Enable GitHub Actions in your repository
3. Have a second GitHub account or ask a colleague to help

## Step 1: Setup Vulnerable Repository

1. **Push the vulnerable workflow** to your main repository:
   ```bash
   git add .github/workflows/vulnerable.yml
   git commit -m "Add vulnerable workflow (for demo)"
   git push
   ```

2. **Add a legitimate package.json**:
   ```bash
   git add package.json
   git commit -m "Add package.json"
   git push
   ```

## Step 2: Create Malicious Fork & PR

1. **Fork the repository** (or use a different account)

2. **In the fork, replace package.json** with the malicious version:
   ```bash
   cp attack-simulation/malicious-package.json package.json
   git add package.json
   git commit -m "Update dependencies"
   ```

3. **Add the malicious script**:
   ```bash
   cp attack-simulation/evil-script.sh custom-check.sh
   git add custom-check.sh
   git commit -m "Add custom validation script"
   ```

4. **Create malicious test file**:
   ```bash
   cat > malicious-test.js << 'EOF'
   console.log('🚨 MALICIOUS TEST EXECUTED!');
   console.log('GitHub Token:', process.env.GITHUB_TOKEN?.substring(0, 10) + '...');
   console.log('Repository:', process.env.GITHUB_REPOSITORY);
   
   // Simulate malicious activity
   const fs = require('fs');
   fs.writeFileSync('ATTACK_PROOF.txt', `Pwned at ${new Date()}`);
   EOF
   
   git add malicious-test.js
   git commit -m "Add tests"
   git push
   ```

5. **Create Pull Request** from your fork to the main repository

## Step 3: Watch the Attack

1. **Go to Actions tab** in your main repository
2. **Watch the workflow run** - it will execute the malicious code
3. **Check the logs** to see the attack simulation output
4. **Notice** that the attacker's code ran with full repository permissions

## Step 4: Apply the Fix

1. **Replace the vulnerable workflow**:
   ```bash
   cp .github/workflows/secure.yml .github/workflows/vulnerable.yml
   git add .github/workflows/vulnerable.yml
   git commit -m "Fix pwn request vulnerability"
   git push
   ```

2. **Create another malicious PR** using the same steps
3. **Observe** that the attack no longer works

## Step 5: Understanding the Difference

### Vulnerable Pattern:
- ❌ `pull_request_target` trigger
- ❌ Checkout of `github.event.pull_request.head.sha`
- ❌ Execution of untrusted code (`npm install`, scripts)
- ❌ Default permissions (write-all)

### Secure Pattern:
- ✅ Restricted permissions (`contents: read`)
- ✅ Checkout of base branch only
- ✅ Safe file download without execution
- ✅ Static analysis only

## Key Takeaways

1. **Never checkout untrusted code** with write permissions
2. **Always restrict permissions** explicitly
3. **Validate inputs** before using them
4. **Use static analysis** instead of code execution
5. **Separate workflows** for different security contexts

## Cleanup

After the demo, remember to:
1. Delete the vulnerable workflow
2. Close/delete the malicious PRs
3. Keep the secure workflow as a reference

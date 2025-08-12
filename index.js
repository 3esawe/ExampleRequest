// Simple demo application
console.log('🛡️  Pwn Request Demo Application');
console.log('This is a legitimate application file');
console.log('Check the .github/workflows/ directory for the security demo');

const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send(`
    <h1>🛡️ Pwn Request Security Demo</h1>
    <p>This repository demonstrates GitHub Actions security vulnerabilities.</p>
    <p>Check the README.md and attack-simulation/ directory for details.</p>
  `);
});

if (require.main === module) {
  app.listen(port, () => {
    console.log(`Demo app listening at http://localhost:${port}`);
  });
}

module.exports = app;

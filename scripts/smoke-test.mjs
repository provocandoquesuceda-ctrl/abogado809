import process from 'node:process';

const baseUrl = process.argv[2] || process.env.SMOKE_BASE_URL || 'http://localhost:3000';
const checks = [
  { name: 'home', path: '/' },
];

let failed = false;
for (const check of checks) {
  try {
    const response = await fetch(new URL(check.path, baseUrl));
    const body = await response.text();
    const ok = response.ok && body.length > 0;
    console.log(`${ok ? 'PASS' : 'FAIL'} ${check.name} ${response.status} ${check.path}`);
    if (!ok) failed = true;
  } catch (error) {
    console.error(`FAIL ${check.name} ${check.path}: ${error.message}`);
    failed = true;
  }
}

process.exitCode = failed ? 1 : 0;

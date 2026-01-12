const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on("line", line => {
  line = [...line]
    .flatMap(e => [...e.charCodeAt().toString(2).padStart(7, "0")]);
  const keys = [false, false];

  for (const bit of line) {
    keys[bit] = !keys[bit];
  }

  console.log(keys.some(Boolean) ? "trapped" : "free");
});

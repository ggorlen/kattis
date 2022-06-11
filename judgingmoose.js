const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  const [l, r] = line.split(/\s+/).map(Number);
  const points = Math.max(l, r) * 2;

  if (l === 0 && r === 0) {
    console.log("Not a moose");
  }
  else if (l === r) {
    console.log(`Even ${points}`);
  }
  else {
    console.log(`Odd ${points}`);
  }
});

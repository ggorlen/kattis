const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  const [n, w, h] = line.split(" ").map(Number);
  const length = Math.sqrt(w * w + h * h);
  rl.on("line", line => console.log(line > length ? "NE" : "DA"));
});

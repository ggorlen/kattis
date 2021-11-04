const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  console.log(+(line.split(/ +/)[0]) % 2 === 1 ? "Alice" : "Bob");
});

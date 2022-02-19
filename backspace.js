const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
  
rl.once("line", line => {
  const result = [];

  for (let i = 0; i < line.length; i++) {
    line[i] === "<" ? result.pop() : result.push(line[i]);
  }

  console.log(result.join(""));
});

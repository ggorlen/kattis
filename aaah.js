const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
  
rl.once("line", line1 =>
  rl.once("line", line2 =>
    console.log(line1.length < line2.length ? "no" : "go")
  )
);

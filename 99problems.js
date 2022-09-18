const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on("line", line => {
  const n = +line;

  if (n % 100 < 49) {
    console.log(+(~~(n / 100 - 1) + "99"));
  }
  else {
    console.log(+(~~(n / 100) + "99"));
  }
});


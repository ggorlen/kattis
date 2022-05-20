const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.on("line", (line) => {
  const nums = line.split(" ");
  const [x, y] = nums.map(Number);

  if (x === 0 && y === 0) {
    return;
  }
  else if (x + y === 13) {
    console.log("Never speak again.");
  }
  else if (x < y) {
    console.log("Left Beehind.");
  }
  else if (x > y) {
    console.log ("To the convention.");
  }
  else {
    console.log("Undecided.");
  }
});


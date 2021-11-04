const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
  
rl.once("line", line => // collect the first line; in this case, discard it
  rl.on("line", line => {
    const [r, e, c] = line.split(/ +/).map(Number);

    if (e - c > r) {
      console.log("advertise");
    }
    else if (e - c < r) {
      console.log("do not advertise");
    }
    else {
      console.log("does not matter");
    }
  })
);

const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  const rooms = [];
  const [r, n] = line.split(/ +/).map(Number);
  rl.on("line", line => {
      rooms.push(+line);
    })
    .on("close", () => {
      if (r === n) {
        console.log("too late");
      }
      else {
        for (let i = 1; i <= r; i++) {
          if (!rooms.includes(i)) {
            console.log(i);
            break;
          }
        }
      }
    })
  ;
});

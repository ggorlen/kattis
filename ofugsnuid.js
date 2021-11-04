const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let r = 0;
let n = 0;
const rooms = [];
const handlers = [
  line => {
    [r, n] = line.split(/ +/).map(Number);
  },
  line => {
    rooms.push(+line);
  },
];
let lines = 0;

rl.on("line", line => {
    handlers[Math.min(lines++, handlers.length - 1)](line);
  })
  .on("close", () => {
    for (const room of rooms.reverse()) {
      console.log(room);
    }
  })
;

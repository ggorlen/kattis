const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let x = 0;
let n = 0;
let rollover = 0;

const handlers = [
  line => { // handler for line 0
    x = +line;
  },
  line => { // handler for line 1
    n = +line;
  },
  line => { // handler for all remaining lines
    rollover += x - +line;
  },
];
let lines = 0;

rl.on("line", line => {
    handlers[Math.min(lines++, handlers.length - 1)](line);
  })
  .on("close", () => {
    // print the solution
    console.log(rollover + x);
  })
;

// works but don't understand why enough to answer
// https://stackoverflow.com/questions/74368092/kattis-stream-lag
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const lines = [];

rl.once("line", () => {
  rl.on("line", line => {
    lines.push(line.split(/\s+/).map(Number));
  })
  .on("close", () => {
    lines.sort((a, b) => a[1] - b[1]);
    let totalLag = 0;
    let currentTime = 0;

    for (const [time, id] of lines) {
      if (time > id && time > currentTime) {
        totalLag = time - id;
      }

      currentTime = Math.max(currentTime, time) + 1;
    }

    console.log(totalLag);
  });
});

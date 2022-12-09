const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const solve = () => console.log(places.size);

const places = new Set();

rl.once("line", () => {
  rl.on("line", line => {
    if (/^\d+$/.test(line)) {
      if (places.size) {
        solve();
        places.clear();
      }
    }
    else {
      places.add(line);
    }
  });
});
rl.on("close", solve);

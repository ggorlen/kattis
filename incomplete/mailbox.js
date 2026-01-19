const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  rl.on("line", line => {
    const [k, m] = line.split(/\s+/).map(n => +n);
    const memo = {};
    
    const r = (boxes, capacity) => {
      if (boxes < 2 || capacity < 2) {
        return capacity;
      }

      const key = `${boxes}, ${capacity}`;
      if (key  in memo) {
        return memo[key];
      }

      let res = 6000000000;
      for (let i = 1; i <= capacity; i++) {
        const cur = 1 + Math.min(
          r(boxes - 1, capacity - i), // blew up
          r(boxes, capacity - i) // did not blow up
        );

        if (cur < res) {
          res = cur;
        }
      }

      return memo[key] = res;
    };

    console.log(r(k, m));
  });
});

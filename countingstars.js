const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on("line", line => {
    if (/^\d+ \d+$/g.test(line)) {
      if (lines.length) {
        solve(lines, id++);
        lines.length = 0;
      }
    }
    else {
      lines.push(line);
    }
  })
  .on("close", () => solve(lines, id));

let id = 1;
const lines = [];
const dirs = Object.freeze([[-1, 0], [1, 0], [0, 1], [0, -1]]);

const solve = (grid, id) => {
  const flood = (y,  x) => {
    for (const stack = [[y, x]]; stack.length;) {
      const [y, x] = stack.pop();

      if (y < 0 || y >= grid.length || x < 0 ||
          x >= grid[y].length || grid[y][x] === "#") {
        continue;
      }

      grid[y][x] = "#";
      stack.push(...dirs.map(([xx, yy]) => [y + yy, x + xx]));
    }
  };

  grid = grid.map(e => [...e]);
  let count = 0;

  for (let y = 0; y < grid.length; y++) {
    for (let x = 0; x < grid[y].length; x++) {
      if (grid[y][x] === "-") {
        flood(y, x);
        count++;
      }
    }
  }

  console.log(`Case ${id}: ${count}`);
};

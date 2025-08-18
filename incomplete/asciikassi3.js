// Wrong answer, tough to tell what the edge cases are supposed to look like
const rl = require("readline").createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", (line) => {
  rl.close();
  const nums = line.split(" ");
  const [h, w, d] = nums.map(Number);
  const grid = [...Array(1000)]
    .map(() => [...Array(1000)].map(() => " "));

  for (let i = 0; i < h; i++) {
    for (let j = 0; j < w; j++) {
      if (i === 0 || i === h - 1) {
        grid[i][d-1+j] = j === 0 || j === w - 1 ? "+" : "-";
      }
      else if ((j === 0 || j === w - 1) ) {
        grid[i][d-1+j] = "|";
      }
    }
  }

  for (let i = 0; i < d - 1; i++) {
    grid[i+1][d-i-2] = "/";
  }

  for (let i = 0; i < d - 1; i++) {
    grid[i+1][w+d-i-3] = "/";
  }

  for (let i = 0; i < d - 1; i++) {
    grid[h+i][d-i-2] = "/";
  }

  for (let i = 0; i < d - 1; i++) {
    grid[h+i][w+d-i-3] = "/";
  }

  const canOverwrite = ["-", "|"];

  for (let i = 0; i < h; i++) {
    for (let j = 0; j < w; j++) {
      const y = i + d - 1;
      const row = grid[y];

      if (i === 0 || i === h - 1) {
        if (canOverwrite.includes(row[j])) {
          row[j] = "x";
        }
        else {
          row[j] = j === 0 || j === w - 1 ? "+" : "-";
        }
      }
      else if ((j === 0 || j === w - 1) ) {
        if (canOverwrite.includes(row[j])) {
          row[j] = "x";
        }
        else {
          row[j] = "|";
        }
      }
    }
  }

  console.log(grid.map(e => e.join("").trimEnd()).filter(Boolean).join("\n"));
});


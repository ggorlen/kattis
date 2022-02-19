const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  let best = null;
  rl.on("line", line => {
      if (line.length > 4 && new Set(line).size === line.length && 
            (best === null || line.length < best.length ||
            (line.length === best.length && best.localeCompare(line) < 0))) {
        best = line;
      }
    })
    .on("close", () => console.log(best || "neibb!"))
  ;
});

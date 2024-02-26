// TODO: wrong answer
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  rl.on("line", line => {
    const [a, op, b, _ , r] = line.split(/\s+/);
    const bases = "123456789abcdefghijklmnopqrstuvwxyz0";
    const result = [...bases].filter((e, i) => {
      // this could be part of the problem, used since parseInt is too permissive
      if ([...line].some(e => e !== "0" && bases.indexOf(e) > i)) {
        return false;
      }

      const base = i + 1;

      if (base === 1) {
        // https://math.stackexchange.com/q/371972
        return [...a, ...b, ...r].every(f => f === e[0]);
      }

      const aa = parseInt(a, base);
      const bb = parseInt(b, base);
      const rr = parseInt(r, base);
      return (
        op === "+" && aa + bb === rr ||
        op === "-" && aa - bb === rr ||
        op === "*" && aa * bb === rr ||
        op === "/" && Math.abs(aa / bb - rr) < 0.000001
      );
    });
    console.log(result.length ? result.join("") : "invalid");
  });
});

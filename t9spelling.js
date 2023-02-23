const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const letters = [...Array(26)].map((_, i) => String.fromCharCode(i + 97));
const keyPad = Object.fromEntries(
  letters.map((e, i) => {
    if (i > 17) {
      i--;
    }
    if (i > 23) {
      i--;
    }
    return [e, (~~(i / 3) + 2 + "").repeat(1 + (i % 3))];
  })
);
keyPad.s = "7777";
keyPad.z = "9999";

rl.once("line", async () => {
  let i = 1;

  for await (const line of rl) {
    const chunks = [...line].map((e) => keyPad[e] || "0");
    const result = chunks
      .map((e, i) => (i > 0 && chunks[i - 1][0] === e[0] ? ` ${e}` : e))
      .join("");
    console.log(`Case #${i++}: ${result}`);
  }
});

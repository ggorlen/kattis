const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
const nextLine = () => new Promise(res => rl.question("", res));

(async () => {
  const word = (await nextLine()) + " ";
  console.log(word.repeat(3).slice(0, -1));
  rl.close();
})();


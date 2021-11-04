const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
const readLine = () => new Promise(resolve => 
  rl.once("line", line => resolve(line))
);

(async () => {
  console.log((await readLine()).split(/ +/).reduce((a, e) => a + +e, 0));
  rl.close();
})();


const readline = require("readline");

const countWays = (courses, target, memo = {}) => {
  if (target < 0) {
    return 0;
  }
  else if (target === 0) {
    return 1;
  }
  else if (target in memo) {
    return memo[target];
  }

  return (memo[target] = courses.reduce(
    (a, e) => a + countWays(courses, target - e, memo),
    0
  ));
};

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
rl.once("line", line1 => {
  const target = +line1;
  const courses = [];
  rl.once("line", () =>
    rl
      .on("line", line => courses.push(+line))
      .on("close", () => console.log(countWays(courses, target)))
  );
});


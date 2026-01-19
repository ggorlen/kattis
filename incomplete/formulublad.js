// Wrong answer or TLE, should reconstruct knapsack after run
// const key = `${capacity}, ${i}`; -> wrong answer, if I skip cache, TLE
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", (line) => {
  const capacity = +line.trim().split(/\s+/).pop();
  const formulae = [];
  let i = 0;

  rl.on("line", (line) => {
    const [size, importance] = line
      .trim()
      .split(/\s+/)
      .map((e) => +e);
    formulae.push({ size, importance, index: i++ });
  }).on("close", () => solve(formulae, capacity));
});

const solve = (formulae, capacity) => {
  const sumImportance = (a) => a.reduce((a, e) => a + e.importance, 0);
  let bestImportance = 0;
  let bestTaken = [];
  const seen = {};

  const r = (capacity, taken = [], takenVal = 0, i = 0) => {
    if (capacity < 0) {
      return 0;
    }

    const key = `${capacity}, ${i}`;
    if (key in seen) {
      return seen[key];
    }

    if (i >= formulae.length || capacity === 0) {
      if (takenVal > bestImportance) {
        bestImportance = takenVal;
        bestTaken = taken.slice();
      }

      return (seen[key] = takenVal);
    }

    const item = formulae[i];
    taken.push(item.index);
    const takenValue = r(
      capacity - item.size,
      taken,
      takenVal + item.importance,
      i + 1,
    );
    taken.pop();
    const notTakenValue = r(capacity, taken, takenVal, i + 1);
    return (seen[key] = Math.max(takenValue, notTakenValue));
  };

  r(capacity);

  console.log(bestTaken.length, bestImportance);
  console.log(bestTaken.join(" "));
};

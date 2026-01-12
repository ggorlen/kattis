const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
  
rl.once("line", line => {
  rl.close();
  console.log(solve(+line));
});

function solve(n) {
  const factors = [];

  for (let i = 2; i <= n / 2 + 1; i++) {
    if (~~(n / i) === (n / i)) {
      factors.push(i);
    }
  }

  factors.push(n);

  function search(total) {
    if (total > n) {
      return 0;
    }
    else if (total === n) {
      return 0;
    }

    let best = 0;

    for (const factor of factors) {
      if (factor * total > n) {
        continue;
      }

      best = Math.max(search(factor * total), best);
    }

    return best + 1;
  }

  return search(1)
}

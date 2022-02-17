const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.once("line", line => {
  rl.on("line", line => console.log(sim(line)));
});

const sim = s => {
  const parts = [[[]], [[]], [[]]];
  let currPart = 1;
  
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
  
    if (c === "<") {
      for (; currPart >= 0; currPart--) {
        const part = parts[currPart][parts[currPart].length-1];
      
        if (part.length) {
          part.pop();
          break;
        }
      }

      if (currPart < 0) {
        currPart = 0;
      }
    }
    else if (c === "[") {
      currPart = 0;
      const part = parts[currPart];

      if (part[part.length-1].length) {
        parts[currPart].push([]);
      }
    }
    else if (c === "]") {
      currPart = 2;
    }
    else {
      parts[currPart][parts[currPart].length-1].push(c);
    }
  }
  
  parts[0].reverse();
  return parts.map(e => e.map(e => e.join("")).join("")).join("");
};

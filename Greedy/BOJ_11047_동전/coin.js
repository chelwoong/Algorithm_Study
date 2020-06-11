let fs = require("fs");
let input = fs.readFileSync("./stdin").toString().split("\n");
let [count, target] = input[0].split(" ");
count = parseInt(count);
target = parseInt(target);

let result = 0;
for (let i = count; i > 0; i--) {
  const coin = parseInt(input[i]);
  if (target / coin > 0) {
    result += Math.floor(target / coin);
    target %= coin;
  } else {
    break;
  }
}
console.log(result);

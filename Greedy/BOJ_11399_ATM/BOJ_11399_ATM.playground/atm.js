let fs = require("fs");
const path = "/dev/stdin";
let input = fs.readFileSync(path).toString().split("\n");
let result = input[1]
  .split(" ")
  .map((a) => +a)
  .sort((a, b) => a - b)
  .reduce((acc, curr, index, arr) => {
    if (index !== 0) arr[index] = arr[index - 1] + curr;
    return acc + arr[index];
  }, 0);

console.log(result);

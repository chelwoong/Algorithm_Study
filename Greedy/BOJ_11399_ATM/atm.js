let fs = require("fs");
let input = fs.readFileSync("/dev/stdin").toString().split("\n");
let result = input[1]
  .split(" ")
  .map((a) => +a)
  .sort((a, b) => a - b)
  .reduce((acc, curr, index, arr) => {
    arr[index] = arr[index - 1] + curr;
    return acc + arr[index];
  });

console.log(result);

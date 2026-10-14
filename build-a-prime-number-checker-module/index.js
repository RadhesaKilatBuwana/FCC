function isPrime(n) {
  if (!Number.isInteger(n) || n < 2) return false; //cheking if n is integer and larger than 1

  for (let i = 2; i <= Math.sqrt(n); i++) { //looping for each possible round division
    if (n % i === 0) return false;//check if n can be divided by i
  }
  return true;
};

module.exports = {
    isPrime,
};
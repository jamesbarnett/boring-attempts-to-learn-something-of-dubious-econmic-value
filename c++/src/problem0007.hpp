/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */

#include <iostream>
#include <cmath>
#include <iterator>
#include "prime_sieve.hpp"

using namespace std;

long problem7()
{
  size_t n = 10001;
  long limit = ceil(n * log(n) + n * (log(log(n))));
  vector<long> primes;
  prime_sieve(limit, back_inserter(primes));

  return primes[n - 1];
}

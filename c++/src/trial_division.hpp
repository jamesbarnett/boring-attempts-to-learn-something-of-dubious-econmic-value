#ifndef TRIAL_DIVISION_HPP__
#define TRIAL_DIVISION_HPP__

#include <cmath>
#include <iterator>
#include "prime_sieve.hpp"

using namespace std;

template<typename T, typename OutputIterator>
void trial_division(T n, OutputIterator result)
{
  vector<T> primes;
  prime_sieve(static_cast<T>(pow(n, 0.5) + 1), back_inserter(primes));

  for (const T& p : primes)
  {
    if (p * p > n) break;

    while (n % p == 0)
    {
      *result = p;
      ++result;
      n /= p;
    }
  }

  if (n > 1)
  {
    *result = n;
    ++result;
  }
}

#endif


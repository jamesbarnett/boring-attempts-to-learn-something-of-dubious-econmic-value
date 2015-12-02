#ifndef PRIME_SIEVE_HPP__
#define PRIME_SIEVE_HPP__

#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>

using namespace std;

template<typename T, typename OutputIterator>
void prime_sieve(T n, OutputIterator result)
{
  vector<T> candidates(n - 2);
  iota(candidates.begin(), candidates.end(), static_cast<T>(2));

  // Remove even numbers greater than 2 since they can't be prime
  candidates.erase(remove_if(candidates.begin(), candidates.end(),
    [](T value) { return value > static_cast<T>(2) && (value & 1) != 1; }), candidates.end());
  size_t i = 0;

  auto x = candidates[i];

  // For efficiency, terminate loop for numbers greater than the square root of n.
  while (x < sqrt(n))
  {
    candidates.erase(remove_if(candidates.begin(), candidates.end(),
      [&](T y) { return y % x == static_cast<T>(0) && x < y; }), candidates.end());

    sort(candidates.begin(), candidates.end());
    candidates.erase(unique(candidates.begin(), candidates.end()), candidates.end());
    ++i;
    x = candidates[i];
  }

  unique_copy(candidates.begin(), candidates.end(), result);
}

#endif


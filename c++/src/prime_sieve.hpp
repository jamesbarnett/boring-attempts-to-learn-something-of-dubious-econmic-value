#ifndef PRIME_SIEVE_HPP__
#define PRIME_SIEVE_HPP__

#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

template<typename T, typename OutputIterator>
void prime_sieve(T n, OutputIterator result)
{
  vector<T> candidates(n - 2);
  iota(candidates.begin(), candidates.end(), static_cast<T>(2));
  size_t i = 0;

  while (i < candidates.size())
  {
    auto x = candidates[i];
    candidates.erase(remove_if(candidates.begin(), candidates.end(),
      [&](T y) { return y % x == static_cast<T>(0) && x < y; }), candidates.end());

    sort(candidates.begin(), candidates.end());
    candidates.erase(unique(candidates.begin(), candidates.end()), candidates.end());
    ++i;
  }

  unique_copy(candidates.begin(), candidates.end(), result);
}

#endif


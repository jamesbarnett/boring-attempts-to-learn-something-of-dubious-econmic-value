#ifndef PRIME_DIVISION_HPP__
#define PRIME_DIVISION_HPP__

#include "trial_division.hpp"

template<typename T>
map<T, T> prime_division(T n)
{
  vector<T> factors;
  trial_division(n, back_inserter(factors));

  vector<T> unique_factors;
  unique_copy(factors.begin(), factors.end(), back_inserter(unique_factors));

  map<T, T> factor_powers_map;

  for_each(unique_factors.begin(), unique_factors.end(),
    [&](T x) { factor_powers_map.insert(make_pair(x, static_cast<T>(0))); });

  for_each(unique_factors.begin(), unique_factors.end(),
    [&](T x)
    {
      for (auto element_prime_factors : prime_factors)
      {
        auto factor_exponent = count(element_prime_factors.begin(),
          element_prime_factors.end(), x);

        if (factor_exponent > factor_powers_map[x])
        {
          factor_powers_map[x] = factor_exponent;
        }
      };
    });

  return factor_powers_map;
}

#endif


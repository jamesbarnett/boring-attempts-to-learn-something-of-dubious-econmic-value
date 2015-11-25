#ifndef PROBLEM0005_HPP__
#define PROBLEM0005_HPP__

#include <iostream>
#include <algorithm>
#include <iterator>
#include <vector>
#include <numeric>
#include <map>
#include <cmath>
#include "trial_division.hpp"

long problem5()
{
  vector<long> factors(19);
  iota(factors.begin(), factors.end(), 2);
  vector<vector<long>> prime_factors;

  for (auto x : factors)
  {
    prime_factors.push_back(vector<long>());
    trial_division(x, back_inserter(prime_factors.back()));
  }

  vector<long> unique_factors;

  for (auto element_prime_factors : prime_factors)
  {
    for (auto element_factor : element_prime_factors)
    {
      if (count(unique_factors.begin(), unique_factors.end(), element_factor) == 0)
      {
        unique_factors.push_back(element_factor);
      }
    }

    sort(unique_factors.begin(), unique_factors.end());
  }

  map<long, long> factor_powers_map;

  for_each(unique_factors.begin(), unique_factors.end(), [&](long x) { factor_powers_map.insert(make_pair(x, 0UL)); });

  for_each(unique_factors.begin(), unique_factors.end(),
    [&](long x)
    {
      for(auto element_prime_factors : prime_factors)
      {
        auto factor_exponent = count(element_prime_factors.begin(), element_prime_factors.end(), x);

        if (factor_exponent > factor_powers_map[x])
        {
          factor_powers_map[x] = factor_exponent;
        }
      };
    });

  return accumulate(factor_powers_map.begin(), factor_powers_map.end(), 1L,
    [](long previous, const pair<long, long>& factor_with_power)
    {
      return previous *= pow(factor_with_power.first, factor_with_power.second);
    });
}

#endif


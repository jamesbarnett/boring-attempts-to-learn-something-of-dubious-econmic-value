#ifndef PROBLEM0004_HPP__
#define PROBLEM0004_HPP__

/*
 * A palindromic number reads the same both ways. The largest palindrome made from the
 * product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>
#include <iterator>

using namespace std;

bool is_palindrome(const string& str)
{
  return str == string(str.rbegin(), str.rend());
}

int problem4()
{
  vector<int> values(899);

  iota(values.begin(), values.end(), 100);

  vector<int> x_factors(values.rbegin(), values.rend());
  vector<int> y_factors(values.rbegin(), values.rend());

  int max = 0;
  int max_x = 100;
  int max_y = 100;

  for (const int& x : x_factors)
  {
    for (const int& y : y_factors)
    {
      int val = x * y;

      if (is_palindrome(to_string(val)) && val > max)
      {
        max = val;
        max_x = x;
        max_y = y;
      }
    }
  }

  return max;
}

#endif


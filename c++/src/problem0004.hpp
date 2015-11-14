#ifndef PROBLEM0004_HPP__
#define PROBLEM0004_HPP__

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

  vector<int> factors1(values.rbegin(), values.rend());
  vector<int> factors2(values.rbegin(), values.rend());

  int max = 0;
  int max_x = 100;
  int max_y = 100;

  for (const int& x : factors1)
  {
    for (const int& y : factors2)
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


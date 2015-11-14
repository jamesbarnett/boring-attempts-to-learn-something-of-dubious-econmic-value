#ifndef PROBLEM0002_HPP__
#define PROBLEM0002_HPP__

#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>
#include <iterator>

using namespace std;

int fibs_memoized(int n)
{
  static vector<int> fs;

  if (static_cast<int>(fs.size()) < n)
  {
    if (n == 1 || n == 2)
    {
      fs.push_back(1);
      return 1;
    }
    else
    {
      int index = fs.size();

      while (index < static_cast<int>(n))
      {
        fs.push_back(fibs_memoized(index));
        ++index;
      }

      return fs[n - 1] + fs[n - 2];
    }
  }
  else
  {
    return fs[n - 1] + fs[n - 2];
  }
}

int fibs(int n)
{
  if (n == 1 || n == 2)
  {
    return 1;
  }
  else
  {
    return fibs(n - 1) + fibs(n - 2);
  }
}

int problem2()
{
  vector<int> fs;
  int n = 1;
  int x = 0;

  while ((x = fibs(n)) < 4000000)
  {
    fs.push_back(x);
    ++n;
  }

  vector<int> evens;

  copy_if(fs.begin(), fs.end(), back_inserter(evens), [](int val) { return (val & 1) == 0; });
  return accumulate(evens.begin(), evens.end(), 0);
}

#endif


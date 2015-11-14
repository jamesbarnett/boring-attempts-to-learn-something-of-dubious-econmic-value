#ifndef PROBLEM0001_HPP__
#define PROBLEM0001_HPP__

#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>
#include <iterator>

using namespace std;

int problem1()
{
  vector<int> ns(999);
  vector<int> multiples;

  iota(ns.begin(), ns.end(), 1);
  copy_if(ns.begin(), ns.end(), back_inserter(multiples), [](int x) { return x % 3 == 0 || x % 5 == 0; });

  return accumulate(multiples.begin(), multiples.end(), 0);
}

#endif


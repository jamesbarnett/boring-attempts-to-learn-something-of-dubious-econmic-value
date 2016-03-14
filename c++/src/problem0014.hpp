#ifndef PROBLEM14_HPP__
#define PROBLEM14_HPP__

/*
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1)
 * contains 10 terms. Although it has not been proved yet
 * (Collatz Problem), it is thought that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */
#include <iostream>
#include <algorithm>

template<typename T>
T& collatz(T& n)
{
  if (n % 2 == 0) return n / 2;
  else return 3 * n + 1;
}

template<typename T>
vector<T> collatz_sequence(T n)
{
  vector<T> result;

  while (n != 1)
  {
    cout << "n: " << n << endl;
    result.push_back(n);

    n = collatz(n);
  }

  result.push_back(n);

  return result;
}

int problem14()
{
  int i = 999999;
  size_t max = 0;
  int result = i;

  while (i > 1)
  {
    vector<int> cs = collatz_sequence(i);
    // copy(cs.begin(), cs.end(), ostream_iterator<int>(cout, ", "));

    cout << "cs.size: " << cs.size() << ", max: " << max << endl;
    if (cs.size() > max)
    {
      cout << "cs.size: " << cs.size() << endl;
      max = cs.size();
      result = i;
    }

    i--;
  }

  return result;
}

#endif


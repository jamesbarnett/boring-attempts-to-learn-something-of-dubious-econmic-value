// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
//
// a^2 + b^2 = c^2
// For example, 32 + 42 = 9 + 16 = 25 = 52.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.
#include <iostream>
#include <algorithm>
#include <iterator>
#include <numeric>
#include <cmath>

using namespace std;

int problem9()
{
  vector<int> values(1000);
  vector<int> triplet(3);
  int product = 0;

  iota(values.begin(), values.end(), 1);

  for (size_t i = 0; i < values.size(); ++i)
  {
    for (size_t j = i + 1; j < values.size(); ++j)
    {
      for (size_t k = j + 1; k < values.size(); ++k)
      {
        if (values[i] + values[j] + values[k] == 1000 && pow(values[i], 2) + pow(values[j], 2) == pow(values[k], 2))
        {
          product = values[i] * values[j] * values[k];
          goto end;
        }
      }
    }
  }

end:

  return product;
}


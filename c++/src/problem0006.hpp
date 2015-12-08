#include <iostream>
#include <algorithm>
#include <cmath>
#include <numeric>
#include <vector>

using namespace std;

long problem6()
{
  vector<long> values(100);
  iota(values.begin(), values.end(), 1L);

  long sum_of_squares = accumulate(values.begin(), values.end(), 0L,
    [](long total, long value) { return total += pow(value, 2L); });

  long square_of_sums = pow(accumulate(values.begin(), values.end(), 0L,
    [](long total, long value) { return total + value; }), 2L);

  return square_of_sums - sum_of_squares;
}


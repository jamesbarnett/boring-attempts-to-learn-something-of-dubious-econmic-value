/* The sum of the squares of the first ten natural numbers is,
 *
 * 12 + 22 + ... + 102 = 385
 * The square of the sum of the first ten natural numbers is,
 *
 * (1 + 2 + ... + 10)2 = 552 = 3025
 * Hence the difference between the sum of the squares of the first ten natural
 * numbers and the square of the sum is 3025 − 385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred
 * natural numbers and the square of the sum.
 */
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


/* The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
#include <iostream>
#include <iterator>
#include "prime_sieve.hpp"

using namespace std;

long problem10()
{
  vector<long> primes;
  prime_sieve(2000000L, back_inserter(primes));

  return accumulate(primes.begin(), primes.end(), 0L);
}

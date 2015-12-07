module isPrime;

import sieve;
import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;

uint[] trialDivision(uint limit)
{
  auto primes = primeSieve(cast(uint)(limit ^^ 0.5) + 1);
  uint[] factors = [];

  foreach (immutable uint p; primes) {
    if (p * p > limit) break;

    while (limit % p == 0) {
      factors ~= p;
      limit /= p;
    }
  }

  if (limit > 1) factors ~= limit;

  return factors;
}

/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10,001st prime number?
 */

module euler7;

import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;
import std.math;
import sieve;

uint problem7()
{
  uint n = 10_001;
  uint limit = cast(uint)ceil(n * log(n) + n * (log(log(n))));
  uint[] primes = primeSieve(limit);

  return primes[n - 1];
}

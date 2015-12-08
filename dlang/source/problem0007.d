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

module sieve;

import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;

uint[] primeSieve(in uint limit)
{
  if (limit < 2) return [];

  auto composite = new bool[limit];

  foreach (immutable uint n; 2 .. cast(uint)(limit ^^ 0.5) + 1) {
    if (!composite[n]) {
      for (uint k = n * n; k < limit; k += n) {
        composite[k] = true;
      }
    }
  }

  return iota(2, limit).filter!(i => !composite[i]).array;
}

module euler5;

import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;
import sieve;
import isPrime;

long problem5()
{
  auto factors = iota(2, 20);
  uint[][] primeFactorizations;

  foreach (uint x; factors) {
    primeFactorizations ~= x.trialDivision;
  }

  uint[] uniqueFactors;

  foreach (uint[] primeFactors; primeFactorizations) {
    foreach (uint factor; primeFactors) {
      if (count(uniqueFactors, factor) == 0) uniqueFactors ~= factor;
    }
  }

  sort(uniqueFactors);

  ulong[ulong] factorPowersMap;

  foreach (uint uniqueFactor; uniqueFactors) {
    factorPowersMap[uniqueFactor] = 0;
  }

  foreach (uint uniqueFactor; uniqueFactors) {
    foreach (uint[] primeFactors; primeFactorizations) {
      ulong factorExponent = count(primeFactors, uniqueFactor);

      if (factorExponent > factorPowersMap[uniqueFactor]) {
        factorPowersMap[uniqueFactor] = factorExponent;
      }
    }
  }

  long minimumProduct = 1L;

  foreach (ulong factor; uniqueFactors) {
    minimumProduct *= factor ^^ factorPowersMap[factor];
  }

  return minimumProduct;
}

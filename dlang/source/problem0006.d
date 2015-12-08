module euler6;

import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;

long problem6()
{
  auto values = iota(101L); 

  long sumOfSquares = reduce!((long a, long b) { return a += b * b; })(values);
  long squareOfSums = reduce!((long a, long b) { return a +=  b; })(values) ^^ 2L;

  return squareOfSums - sumOfSquares;
}

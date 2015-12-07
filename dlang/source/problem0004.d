module euler4;

/*
 * A palindromic number reads the same both ways. The largest palindrome made from th
 * product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
import std.stdio;
import std.array;
import std.conv;
import std.range;
import std.string;
import std.algorithm;

bool isPalindrome(Range)(Range s) if (isBidirectionalRange!Range)
{
  return s.equal(s.retro);
}

int problem4()
{
  auto x_factors = iota(100, 1000);
  auto y_factors = iota(100, 1000);
  int max = 0;
  int max_x = 100;
  int max_y = 100;

  foreach (x; x_factors)
  {
    foreach (y; y_factors)
    {
      int value = x * y;

      if (isPalindrome(to!string(value)) && value > max)
      {
        max = value;
        max_x = x;
        max_y = y;
      }
    }
  }

  return max;
}

#!/usr/bin/env rdmd

module euler1;

import std.stdio;
import std.array;
import std.range;
import std.algorithm;

int problem1()
{
  return reduce!("a + b")(0, filter!("a % 3 == 0 || a % 5 == 0")(iota(1, 1000)));
}

int problem2()
{
  return reduce!(q{ a + b })(0, filter!(q{ (a & 1) == 0 })(
    until!(q{ a >= 4_000_000 })(recurrence!(q{ a[n - 1] + a[n - 2] })(0, 1))));
}

#!/usr/bin/env rdmd

module euler2;

import std.stdio;
import std.array;
import std.range;
import std.algorithm;

int problem2()
{
  return reduce!(q{ a + b })(0, filter!(q{ (a & 1) == 0 })(
    until!(q{ a >= 4_000_000 })(recurrence!(q{ a[n - 1] + a[n - 2] })(0, 1))));
}

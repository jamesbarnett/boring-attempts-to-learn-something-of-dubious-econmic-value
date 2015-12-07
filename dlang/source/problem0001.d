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


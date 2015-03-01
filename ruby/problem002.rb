#!/usr/bin/env ruby

def fib x
  return 1 if x == 1
  return 1 if x == 2
  fib(x - 1) + fib(x - 2)
end

fibs = []
i = 1

while fib(i) < 4_000_000
  fibs << fib(i)
  i += 1
end

puts fibs.select {|x| x % 2 == 0 }.inject {|acc, x| acc += x }

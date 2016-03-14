#!/usr/bin/env ruby -w

#
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
def collatz(n)
  case n % 2
  when 0
    n / 2
  when 1
    3 * n + 1
  end
end

def collatz_sequence(n)
  cs = []

  while n != 1
    cs << n
    n = collatz n
  end

  cs << n
end

i = 999_999
max = 0
seed = i

while i > 1
  cs = collatz_sequence i

  if cs.size > max
    seed = i if cs.size > max
    max = cs.size if cs.size > max
  end

  i = i - 1
end

puts "max: #{max} seed: #{seed}"

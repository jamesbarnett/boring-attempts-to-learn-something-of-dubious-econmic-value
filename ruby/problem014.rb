#!/usr/bin/env ruby -w

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

#puts collatz_sequence(13).join ", "

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

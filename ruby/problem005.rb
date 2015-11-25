#!/usr/bin/env ruby

def prime_sieve(n)
  vs = (2..n).to_a
  primes = []

  while !vs.empty?
    primes << vs.shift
    vs.reject! { |v| v % primes.last == 0 }
  end

  primes
end

def trial_division(n)
  return 1 if n == 1

  primes = prime_sieve((n ** 0.5).to_i + 1)
  prime_factors = []

  primes.each do |p|
    break if p * p > n
    while n % p == 0
      prime_factors << p
      n /= p
    end
  end

  prime_factors << n if n > 1

  prime_factors
end

factors = (2..20).to_a
prime_factors = factors.map { |x| trial_division(x) }
unique_factors = prime_factors.flatten.uniq.sort

factor_powers = {}
unique_factors.each do |f|
  factor_powers[f] = 0
end

prime_factors.each do |element_prime_factors|
  element_prime_factors.each do |factor|
    count = element_prime_factors.count(factor)
    factor_powers[factor] = count if count > factor_powers[factor]
  end
end

val = factor_powers.inject(1) { |acc, e| acc *= e.first ** e.last }
puts val


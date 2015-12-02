#!/usr/bin/env ruby -w

require_relative "./euler"

euler = Euler.new
primes = euler.prime_sieve 2_000_000
puts primes.inject { |x, y| x + y }

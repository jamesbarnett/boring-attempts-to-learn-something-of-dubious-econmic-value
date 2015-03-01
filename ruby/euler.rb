# module Euler
#   def denominators n
#     #(prime_factors.uniq + composites(n)).sort.unshift(1).push(n)
#   end
#
#   def composites n
#     factorization = prime_factorization(n)
#     cs = []
#   end
# end

class Euler
  attr_accessor :primes, :prime_factors, :prime_factorizations, :max

  def initialize
    self.primes = []
    self.prime_factors = {}
    self.prime_factorizations = {}
    self.max = 0
  end

  def prime_sieve n
    return primes.select {|x| x <= n } if n < max

    s = (0..n).to_a
    s[0] = s[1] = nil

    s.each do |p|
      next unless p
      break if p * p > n
      (p * p).step(n, p) {|m| s[m] = nil }
    end

    self.primes = s.compact
  end

  def trial_division n
    return [1] if n == 1
    return prime_factors[n] if prime_factors[n]
    self.primes = prime_sieve((n ** 0.5).to_i + 1)
    prime_factors[n] = []

    primes.each do |p|
      break if p * p > n
      while n % p == 0
        prime_factors[n] << p
        n /= p
      end
    end

    prime_factors[n] << n if n > 1

    prime_factors[n]
  end

  def prime_factorization n
    prime_factors[n] ||= trial_division n
    prime_factors[n].inject({}) do |acc, val|
      acc[val] = prime_factors[n].count(val)
      acc
    end
  end

  def composites n
    factorization = prime_factorization n
  end
end

defmodule Prime do
  def prime_sieve(n), do: Enum.to_list(2..n) |> _primes([])

  defp _primes([head | tail], primes) do
    _primes(Enum.filter(tail, &(rem(&1, head) == 0)), primes ++ [head])
  end

  defp _primes([], primes), do: primes

  def trial_division(n), do: _trial_division(n, prime_sieve(n), [])

  defp _trial_division(n, [head | tail], prime_factors) do
    if :math.pow(head, 0.5) + 1 > n do
      prime_factors
    else
      # Shouldn't automatically add head here.
      # Need to check if rem(n, head) == 0... maybe use Enum.filter
      _trial_division(div(n, head), tail, prime_factors ++ [head])
    end
  end
end

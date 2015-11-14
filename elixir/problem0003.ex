defmodule M do
  def prime?(n) do
    ns = Enum.to_list(Stream.iterate(2, &(&1 + 1)) |> Stream.take(div(n, 2)))
    !Enum.any?(ns, fn x -> rem(n, x) == 0 end)
  end

  def sieve_of_e(n) do
    Stream.iterate(2, &(&1 + 1)) |> Stream.take(n) |> Enum.to_list |> Enum.filter(&(prime?(&1)))
  end
end

M.sieve_of_e(:math.sqrt 600_851_475_143)

# IO.puts(Enum.join(Enum.map(M.sieve_of_e(600_851_475_143), &(Integer.to_string(&1))),","))

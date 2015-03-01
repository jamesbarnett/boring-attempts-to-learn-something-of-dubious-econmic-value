defmodule M do
  def multiples_of_3_or_5(n) do 
    rem(n, 3) == 0 || rem(n, 5) == 0
  end
end

IO.puts 1..999 |> Enum.filter(&(M.multiples_of_3_or_5(&1))) |> Enum.sum


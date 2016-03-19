defmodule Problem0006 do
  def solution do
    vals = Enum.to_list 1..100
    sum_of_squares = vals |> Enum.reduce(0, fn (x, acc) -> acc + :math.pow(x, 2) end)
    square_of_sums = vals |> Enum.reduce(0, fn (x, acc) -> acc + x end) |> :math.pow(2)
    square_of_sums - sum_of_squares
  end
end

IO.puts Problem0006.solution

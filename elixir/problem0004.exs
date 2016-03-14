defmodule M do
  def palindrome?(x) do
    x === String.reverse(x)
  end

  def problem4 do
    for x <- Enum.to_list(100..999), y <- Enum.to_list(100..999),
      Integer.to_string(x * y) |> palindrome? do
        x * y
      end
    |> Enum.max
  end
end

IO.puts("Problem 4: #{M.problem4}")

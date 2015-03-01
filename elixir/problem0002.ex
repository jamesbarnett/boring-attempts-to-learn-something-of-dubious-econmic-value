defmodule M do
  def fib(1) do 1 end
  def fib(2) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end
end

import Enum
import Integer

IO.puts Stream.iterate(1, &(&1 + 1)) 
  |> take_while(fn n -> M.fib(n) < 4_000_000 end) 
  |> map(fn n -> M.fib(n) end)
  |> filter(&(is_odd(&1)))
  |> sum


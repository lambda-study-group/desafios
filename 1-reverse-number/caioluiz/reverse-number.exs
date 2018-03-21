defmodule Solution do
  def reverse_number(num) when is_integer(num) do
    num
    |> Integer.to_charlist
    |> Enum.reduce([], fn x, acc -> [x | acc] end)
    |> List.to_integer
  end
  
  def reverse_number(something_else), do: "#{something_else} is not a number"
end

IO.puts Solution.reverse_number 123
IO.puts Solution.reverse_number 12
IO.puts Solution.reverse_number 0
IO.puts Solution.reverse_number 6641112222223333333345678901118
IO.puts Solution.reverse_number 'lalala'

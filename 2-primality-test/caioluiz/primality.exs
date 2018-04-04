defmodule Solution do
  defp all?([], _ ), do: true

  defp all?([head | tail], pred) do
    if pred.(head) do
      all?(tail, pred)
    else false end
  end
  
  def prime?(2), do: true
  def prime?(n) do
    2..n-1
    |> Enum.to_list
    |> all?(fn x -> rem(n, x) != 0 end)
    #Enum.all?(2..n-1, fn x -> rem(n, x) != 0 end)
  end
end

IO.puts Solution.prime? 0         #false
IO.puts Solution.prime? 1         #false
IO.puts Solution.prime? 2         #true 
IO.puts Solution.prime? 3         #true
IO.puts Solution.prime? 79        #true
IO.puts Solution.prime? 1471      #true
IO.puts Solution.prime? 104742    #false
IO.puts Solution.prime? 104743    #true


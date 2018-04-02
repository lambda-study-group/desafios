defmodule Primality do
  @spec prime?(integer) :: boolean

  def prime?(0), do: false
  def prime?(1), do: false
  def prime?(num) do
    size = 2..num
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> length()

    size == 1
  end
end

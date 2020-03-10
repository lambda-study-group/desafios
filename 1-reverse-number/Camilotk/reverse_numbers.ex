defmodule My.Number do
  @moduledoc """
  Module that contains number functions.
  """

   @doc """
   Reverts an integer

   ### Examples:
      iex> My.Number.reverse_number(-98)
             -89
   """
  def reverse_number(number, reverse \\ 0)
  def reverse_number(number, _reverse) when not is_integer(number), do: "Erro"
  def reverse_number(number, reverse) when number === 0 do
    reverse
  end
  def reverse_number(number, reverse)  do
    lastDigit = rem(number, 10)
    reverseValue = (reverse * 10) + lastDigit
    remain = div(number, 10)
    reverse_number(remain, reverseValue)
  end
end

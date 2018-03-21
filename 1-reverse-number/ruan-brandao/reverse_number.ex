defmodule ReverseNumber do
  @moduledoc """
  Module containing a function to reverse an integer.
  """

  @doc """
  Reverts an integer

  ## Examples
      iex> ReverseNumber.reverse(12345)
      54321
  """
  def reverse(number) when is_integer(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.join()
    |> String.to_integer()
  end

  def reverse(_number), do: {:error, "Invalid Input"}
end

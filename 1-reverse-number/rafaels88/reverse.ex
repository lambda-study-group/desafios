defmodule Number do
  @doc """
  Reverts a given integer.

  ## Usage

    iex> Number.reverse(123)
    321

  If given param is not an integer, an "error" string will be returned.
  """
  @spec reverse(integer()) :: integer() | String.t
  def reverse(number) when is_integer(number) do
    number
    |> to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  def reverse(_), do: "erro"
end

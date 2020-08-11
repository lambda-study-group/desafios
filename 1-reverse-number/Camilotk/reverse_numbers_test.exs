ExUnit.start()

defmodule My.Number.Test do
  use ExUnit.Case, async: true
  alias My.Number

  setup do
    Code.require_file("reverse_numbers.ex")
    :ok
  end

  describe "reverse_number/1" do
    test "reverts the number when is an integer" do
      assert My.Number.reverse_number(987) == 789
    end

    test "returns error when given param is not an int" do
      assert My.Number.reverse_number("Elixir é da hora") == "Erro"
    end
  end
end

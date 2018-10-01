ExUnit.start()

defmodule NumberTest do
  use ExUnit.Case, async: true
  alias Number

  setup do
    Code.require_file("reverse.ex")
    :ok
  end

  describe "reverse/1" do
    test "reverts the number when is an integer" do
      assert Number.reverse(123) == 321
    end

    test "returns error when given param is not an int" do
      assert Number.reverse("123") == "erro"
    end
  end
end

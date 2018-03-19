ExUnit.start()
ExUnit.configure(trace: true, exclude: :pending)
Code.load_file("reverse_number.ex", __DIR__)

defmodule ReverseNumberTest do
  use ExUnit.Case

  describe "reverse/1" do
    test "reverses an integer number" do
      assert ReverseNumber.reverse(1234) == 4321
      assert ReverseNumber.reverse(12) == 21
      assert ReverseNumber.reverse(0) == 0

      assert ReverseNumber.reverse(6_641_112_222_223_333_333_345_678_901_118) ==
               8_111_098_765_433_333_333_222_222_111_466
    end

    test "fails when argument is not a number" do
      assert ReverseNumber.reverse("lalala") == {:error, "Invalid Input"}
    end
  end
end

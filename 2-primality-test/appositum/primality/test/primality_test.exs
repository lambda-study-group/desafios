defmodule PrimalityTest do
  use ExUnit.Case
  doctest Primality

  
  test "Prime numbers" do
    test_cases = [
        {0, false},
        {1, false},
        {2, true},
        {3, true},
        {79, true},
        {1471, true},
        {104742, false},
        {104743, true}
      ]

    test_cases
    |> Enum.map(fn {n, bool} -> assert Primality.prime?(n) == bool end)
  end
end


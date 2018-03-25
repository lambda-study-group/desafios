defmodule PrimalityTest do
  use ExUnit.Case
  doctest Primality

  test "Test prime numbers" do
    assert Primality.prime?(0) == false
    assert Primality.prime?(1) == false
    assert Primality.prime?(2) == true
    assert Primality.prime?(3) == true
    assert Primality.prime?(79) == true
    assert Primality.prime?(1471) == true
    assert Primality.prime?(104742) == false
    assert Primality.prime?(104743) == true
  end
end


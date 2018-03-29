defmodule PrimalityTest do
  def check_prime(2), do: true
  def check_prime(number) do
    Enum.reduce_while(2..(number - 1), false, fn (n, _res) ->
      if rem(number, n) == 0 do
        {:halt, false}
      else
        {:cont, true}
      end
    end)
  end
end

defmodule Test do
  import PrimalityTest

  def test(number) do
    IO.puts("#{number} is prime? #{check_prime(number)}")
  end
end


Test.test(0)
Test.test(1)
Test.test(2)
Test.test(3)
Test.test(79)
Test.test(1471)
Test.test(104742)
Test.test(104743)

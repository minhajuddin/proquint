defmodule ProquintTest do
  use ExUnit.Case
  doctest Proquint

  # TODO: add more examples

  test "encode" do
    bin = << 63 :: size(8), 84 :: size(8), 220 :: size(8), 193 :: size(8) >>
    assert Proquint.encode(bin) == "gutih-tugad"
    IO.inspect Proquint.encode(bin)
  end

  test "decode" do
    bin = << 63 :: size(8), 84 :: size(8), 220 :: size(8), 193 :: size(8) >>
    assert Proquint.decode("gutih-tugad") == bin
  end
end

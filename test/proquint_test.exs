defmodule ProquintTest do
  use ExUnit.Case
  doctest Proquint

  @test_cases [
    %{binary: <<63::size(8), 84::size(8), 220::size(8), 193::size(8)>>, encoded: "gutih-tugad"},
    %{binary: <<127, 0, 0, 1>>, encoded: "lusab-babad"},
    %{binary: <<63, 118, 7, 35>>, encoded: "gutuk-bisog"},
    %{binary: <<140, 98, 193, 141>>, encoded: "mudof-sakat"},
    %{binary: <<64, 255, 6, 200>>, encoded: "haguz-biram"},
    %{binary: <<128, 30, 52, 45>>, encoded: "mabiv-gibot"},
    %{binary: <<147, 67, 119, 2>>, encoded: "natag-lisaf"},
    %{binary: <<212, 58, 253, 68>>, encoded: "tibup-zujah"},
    %{binary: <<216, 35, 68, 215>>, encoded: "tobog-higil"},
    %{binary: <<216, 68, 232, 21>>, encoded: "todah-vobij"},
    %{binary: <<198, 81, 129, 136>>, encoded: "sinid-makam"},
    %{binary: <<12, 110, 110, 204>>, encoded: "budov-kuras"}
  ]

  test "encode" do
    for test_case <- @test_cases do
      assert Proquint.encode(test_case.binary) == test_case.encoded
    end
  end

  test "decode" do
    for test_case <- @test_cases do
      assert Proquint.decode(test_case.encoded) == test_case.binary
    end
  end

  test "encode with separator" do
    for test_case <- @test_cases do
      assert Proquint.encode(test_case.binary, ".") == String.replace(test_case.encoded, "-", ".")
    end
  end

  test "decode with separator" do
    for test_case <- @test_cases do
      encoded = String.replace(test_case.encoded, "-", ".")
      assert Proquint.decode(encoded, ".") == test_case.binary
    end
  end
end

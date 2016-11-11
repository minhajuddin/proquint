# Proquint

[![Travis](https://img.shields.io/travis/minhajuddin/proquint.svg?style=flat-square)](https://travis-ci.org/minhajuddin/proquint)
[![Hex.pm](https://img.shields.io/hexpm/v/proquint.svg?style=flat-square)](https://hex.pm/packages/proquint)
[![Hex.pm](https://img.shields.io/hexpm/dt/proquint.svg?style=flat-square)](https://hex.pm/packages/proquint)

An elixir package that converts ids to proquints,
Identifiers that are Readable, Spellable, and Pronounceable.
More info about proquints can be found at: https://arxiv.org/html/0901.4016

## Usage
~~~elixir
# encode
bin = << 63 :: size(8), 84 :: size(8), 220 :: size(8), 193 :: size(8) >>
assert Proquint.encode(bin) == "gutih-tugad"

# decode
bin = << 63 :: size(8), 84 :: size(8), 220 :: size(8), 193 :: size(8) >>
assert Proquint.decode("gutih-tugad") == bin
~~~

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `proquint` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:proquint, "~> 0.1.0"}]
    end
    ```

  2. Ensure `proquint` is started before your application:

    ```elixir
    def application do
      [applications: [:proquint]]
    end
    ```


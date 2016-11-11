# Proquint

~~~elixir
IO.inspect Proquint.encode << 0 :: size(16)>>
IO.inspect Proquint.encode << 63 :: size(8), 84 :: size(8), 220 :: size(8), 193 :: size(8) >>
~~~

**TODO: Add description**

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


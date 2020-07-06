defmodule Proquint.Mixfile do
  use Mix.Project

  def project do
    [
      app: :proquint,
      name: "Proquint",
      description: description(),
      package: package(),
      docs: [
        extras: ~W(README.md)
      ],
      version: "1.0.2",
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 0.4", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    An elixir package that converts ids to proquints,
    Identifiers that are Readable, Spellable, and Pronounceable.
    More info about proquints can be found at: https://arxiv.org/html/0901.4016
    """
  end

  defp package do
    [
      description: description(),
      files: ~w(lib config mix.exs README.md LICENSE),
      maintainers: ["Khaja Minhajuddin"],
      licenses: ["MIT"],
      links: %{
        "Github" => "http://github.com/minhajuddin/proquint",
        "Docs" => "http://hexdocs.pm/proquint"
      }
    ]
  end
end

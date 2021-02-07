defmodule PensadorBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :pensador_crawler,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PensadorBot.Application, [env: Mix.env()]},
      applications: applications(Mix.env())
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_), do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.1"},
      {:extwitter, "~> 0.8"},
      {:httpoison, "~> 1.5.1"},
      {:plug_cowboy, "~> 2.2"}
    ]
  end
end

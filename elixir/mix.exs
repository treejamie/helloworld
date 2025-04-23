defmodule Hackerank.MixProject do
  use Mix.Project

  @doc """
  Even a basic project should have some configuration
  """
  def project do
    [
      app: :helloworld,
      version: "1.0.0",
      deps: deps(),
      name: "HelloWorld - Elixir",
      source_url: "https://github.com/treejamie/helloworld/elixir",
      homepage_url: "https://your_homepage.com",
      docs: [
        formatters: ["html"],
        main: "api-reference",
      ]
    ]
  end

  def application do
    [
      mod: {Hello.World, []}
    ]
  end

  defp deps do
    [
      {:csv, "~> 3.2"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false}
    ]

  end
end

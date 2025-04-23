defmodule Hackerank.MixProject do
  use Mix.Project

  @doc """
  Even a basic project should have some configuration
  """
  def project do
    [
      app: :helloworld,
      version: "1.0.0",
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Hello.World, []}
    ]
  end

  defp deps do
    [{:csv, "~> 3.2"}]
  end
end

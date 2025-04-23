defmodule Hackerank.MixProject do
  use Mix.Project

  @doc """
  Even a basic project should have some configuration
  """
  def project do
    [
      app: :helloworld,
      version: "1.0.0"
    ]
  end

  def application do
    [
      mod: {Hello.World, []}
    ]
  end
end

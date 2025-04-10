defmodule Hello.World do
  @moduledoc """
  Hello has one purpose: to say Hello, world!

  However, saying hello is a business fraught with peril and uncertainty.
  """

  @doc """
  Returns "Hello, world!"

  ## Examples

    iex> Hello.World.speak_normally()
    "Hello, world!"
  """
  def speak_normally() do
    "Hello, world!"
  end

  @doc """
  Returns a nice Geordie phrase: "Alreet, hamma!"

  ## Examples

    iex> Hello.World.speak_geordie()
    "Alreet, hamma!"
  """
  def speak_geordie() do
    "Alreet, hamma!"
  end

  @doc """
  Returns either a "normal" greeting or a Geordie greeting.

  ## Examples

    iex> Hello.World.random_greeting() in ["Hello, world!", "Alreet, hamma!"]
    true
  """
  def random_greeting() do
    Enum.random([speak_geordie(), speak_normally()])
  end
end

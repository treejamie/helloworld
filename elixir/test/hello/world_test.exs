defmodule Hello.WorldTest do
  use ExUnit.Case
  alias Hello.World
  doctest Hello.World

  test "random is predictable" do
    assert World.random_greeting() in ["Alreet, hamma!", "Hello, world!"]
  end

  test "speak_normally" do
    assert World.speak_normally() == "Hello, world!"
  end

  test "speak_geordie" do
    assert World.speak_geordie() == "Alreet, hamma!"
  end

end

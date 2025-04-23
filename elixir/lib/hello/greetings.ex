defmodule Hello.Greetings do
  @moduledoc """
  An elixir interface to the project CSV file with all of the greetings.
  """

  @doc """
  Loads the "Hello, world!" strings from CSV file into a list
  """
  def load_greetings() do
    File.stream!("../hello_world_30_languages.csv")
    |> CSV.decode!()
    |> Enum.to_list()
    |> Enum.map(fn [_, greeting | _] -> greeting end)
  end
end

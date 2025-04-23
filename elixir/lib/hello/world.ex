defmodule Hello.World do
  @moduledoc """
  The main **Hello World application entry point**.

  - Starts the **ServerSupervisor**, which in turn supervises:
    - The **Introvert server** (handles quiet tolerance).
    - The **Extrovert server** (enthusiastically greets the world).

  Demonstrates **application startup**, **supervision trees**, and **process interaction** in Elixir.
  """

  use Application

  @impl true
  @doc """
  Starts the **Hello World application**.

  - Initializes the **supervision tree** by starting the `Hello.ServerSupervisor`.
  """
  def start(_type, _args) do
    IO.puts "Starting the Hello World application ..."
    Hello.ServerSupervisor.start_link()
  end

end

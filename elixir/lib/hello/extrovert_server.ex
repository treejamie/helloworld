defmodule Hello.ExtrovertServer do
  @moduledoc """
  The **Extrovert server** thrives on interaction and energetically
  says "Hello, World!" in random languages.

  It continuously sends greetings to the **Introvert server** and
  handles termination gracefully when shut down (likely for talking too much).

  ## State
  - `:greetings` - A list of greeting phrases loaded at startup. Populated from CSV

  ## Behavior
  - Starts talking immediately after initialization and every 1200ms after that.
  - Sends a `:hello` message to the `:introvert` process with each greeting.
  - Handles termination by outputting a farewell message.

  Designed to **demonstrate fault tolerance** and **process communication**.
  """
  use GenServer
  alias Hello.Greetings

  @name :extrovert

  @doc """
  Starts the **Extrovert server**.

  This function links the process and registers it under the `:extrovert` name.
  """
  def start_link(_) do
    IO.puts "Starting the Extrovert server..."

    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  @impl true
  @doc false
  def init(_state) do
    # catch the exits so we can have some dialogue around that,
    Process.flag(:trap_exit, true)

    # start talking - incestantly.
    Process.send_after(self(), :talk, 1200)

    # load the greetings from the CSV
    greetings = Greetings.load_greetings()

    # response
    {:ok, %{greetings: greetings}}
  end

  @impl true
  @doc """
  Handles termination of the **Extrovert server**.
  (_probably because it talked too much_)
  """
  def terminate(_reason, _state) do
    IO.puts("\e[96m (extrovert): \e[95mY U SHUT ME DOWN FREN?.\e[0m")
    :ok
  end


  @impl true
  @doc """
  Handles the `:talk` message.

  - Picks a random greeting from the state.
  - Sends the greeting to the console.
  - Sends a `:hello` message to the `:introvert` process.
  - Schedules the next `:talk` message.

  Updates the internal state by removing the used greeting.
  """
  def handle_info(:talk, state) do
    # get a random index
    random_index = Enum.random(0..(length(state[:greetings]) - 1))
    # get a random greeting
    {greeting, greetings} =
      state[:greetings]
      |> List.pop_at(random_index)
    # speak
    IO.puts("\e[96m (extrovert): #{greeting}\e[0m")

    # send the message to introvert
    send(:introvert, :hello)

    # now shedule it again
    Process.send_after(self(), :talk, 1200)

    # and process the response, with an updated state
    {:noreply, %{state | greetings: greetings}}
  end
end

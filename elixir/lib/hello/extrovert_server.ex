defmodule Hello.ExtrovertServer do
  use GenServer
  alias Hello.Greetings

  @name :extrovert

  def start_link(_) do
    IO.puts "Starting the Extrovert server..."

    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def init(_state) do
    # catch the exits so we can have some dialogue around that,
    Process.flag(:trap_exit, true)

    # start talking - incestantly.
    Process.send_after(self(), :talk, 1200)

    # load the greetings from the CSV
    greetings = Greetings.load_greetings()

    # response
    {:ok, []}
  end

  @doc """
  Terminate the Extrovert  - probably because it talked too much
  """
  def terminate(_reason, _state) do
    IO.puts("\e[96m (extrovert): \e[95mY U SHUT ME DOWN FREN?.\e[0m")
    :ok
  end


  @doc """
  Repeatedly sends a Hello, world! message
  """
  def handle_info(:talk, state) do
    # speak
    IO.puts("\e[96m (extrovert): Hello, world!\e[0m")

    # send the message to introvert
    send(:introvert, :hello)

    # now shedule it again
    Process.send_after(self(), :talk, 1200)

    # and process the response
    {:noreply, state}
  end


end

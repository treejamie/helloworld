defmodule Hello.IntrovertServer do
  @moduledoc """
  The Introvert server enjoys quiet and prefers silence.

  It will be polite about requesting silence, up to a point, but after that
  the introvert may get quite forceful about matters. The introvert has a
  finite temper and may get "propery radgy" (geordie english).

  The introvert server always apologises for getting mad, and will clean
  up any mess that it has created. It doesn't hold a grudge but it also
  isn't very clever.

  The introvert only speaks English.

  """
  use GenServer

  @name :introvert

  def start_link(_) do
    IO.puts "Starting the Introvert server... (reluctantly)"
    GenServer.start_link(__MODULE__, 0 , name: @name)
  end

  @doc """
  Intialise function. State is a count of the amount of times introvert
  has told extrovert to be quiet. In a practical sense though it could
  be anything.

  ## Parameters
  - state (integer): start at zero for maximum introvert tolerance
  """
  def init(state) do
    {:ok, state}
  end


  @doc """
  When the state is eight, introverts flip tables and kill things
  """
  def handle_info(:hello, 8) do

    # table flip
    IO.puts "\n\n"
    IO.puts "\e[90m(introvert):\e[0m \e[91m(╯°□°）╯︵ ┻━┻\e[0m"
    IO.puts "\e[90m(introvert):\e[0m \e[91mYou totally had that coming.\e[0m"
    IO.puts "\n\n"
    # enough is enough, kill the extrovert
    Supervisor.terminate_child(Hello.ServerSupervisor, :extrovert)

    # finally the introvert has some time to recharge
    IO.puts "\e[90m(introvert):\e[0m \e[32m(＾▽＾) Blissful silence.\e[0m"

    # but also, specify a future time to apologise and start it again
    Process.send_after(self(), :regret, 5000)

    # reset the state
    {:noreply, 0}
  end

  def handle_info(:regret, _state) do
    # the server is lonely
    IO.puts "\e[90m(introvert):\e[0m \e[32m(╥﹏╥) I'm lonely and full of regret. Come back friend.\e[0m"

    # start the extovert again
    Supervisor.restart_child(Hello.ServerSupervisor, :extrovert)

    # reply with a reset state (Introvert has calmed down)
    {:noreply, 0}
  end

  def handle_info(:hello, state) do
    # the introvert speaks inside his own head - which is the terminal.
    cond do
      state == 0 ->
        IO.puts "\e[90m(introvert):\e[0m \e[32m(＾▽＾) Please, be quiet.\e[0m"
      state < 3 ->
        IO.puts "\e[90m(introvert):\e[0m \e[94m(¬‿¬) Again, please, be quiet.\e[0m"
      state < 5 ->
        IO.puts "\e[90m(introvert):\e[0m \e[93m(ಠ_ಠ) Mate, for the #{state}th time - SHUT UP.\e[0m"
      true ->
        IO.puts "\e[90m(introvert):\e[0m \e[38;2;255;165;0m(╬ಠ益ಠ) Am getting proper radgey me like.\e[0m"
    end

    # now return the correct response and the updated state
    {:noreply, state + 1}
  end

end

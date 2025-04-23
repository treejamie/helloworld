defmodule Hello.IntrovertServer do
  @moduledoc """
  The **Introvert server** enjoys peace and quiet but has limited patience
  for interruptions.

  When greeted (`:hello`), the introvert politely requests silence up to a point,
  gradually escalating in frustration. If pushed too far (state reaches 8),
  it **flips tables**, **terminates the Extrovert server**, and enjoys a period
  of blissful silence. After a cooldown, the introvert feels regret and
  **restarts the Extrovert server**.

  ## State
  - Integer count representing the **number of times** the introvert has
    been disturbed.

  ## Behavior
  - Politely asks for quiet until its **temper threshold** is reached.
  - Shuts down the **Extrovert server** at peak frustration.
  - Waits before **restarting Extrovert** after calming down.
  """
  use GenServer

  @name :introvert

  @doc """
  Starts the **Introvert server**.

  Registers the process under the `:introvert` name and initializes state to `0`.
  """
  def start_link(_) do
    IO.puts("Starting the Introvert server... (reluctantly)")
    GenServer.start_link(__MODULE__, 0, name: @name)
  end

  @impl true
  @doc """
  Initializes the **Introvert server**.

  - **State**: Starts at `0`, representing the introvert's tolerance level.

  ## Parameters
  - `state` (integer): Initial state, defaults to `0`.
  """
  def init(state) do
    {:ok, state}
  end

  @impl true
  @doc """
  Handles incoming `:hello` and `:regret` messages.

  - On `:hello`, escalates responses based on the current state.
  - At state 8, flips tables, terminates the extrovert, and schedules regret.
  - On `:regret`, restarts the extrovert and resets state.
  """
  def handle_info(:regret, _state) do
    # the server is lonely
    IO.puts(
      "\e[90m(introvert):\e[0m \e[32m (ಥ﹏ಥ) I'm lonely and full of regret. DO ME A RETURN FREN.\e[0m"
    )

    # start the extovert again
    Supervisor.restart_child(Hello.ServerSupervisor, :extrovert)

    # reply with a reset state (Introvert has calmed down)
    {:noreply, 0}
  end

  @impl true
  @doc false
  def handle_info(:hello, 8) do
    # table flip
    IO.puts("\n\n")
    IO.puts("\e[90m(introvert):\e[0m \e[91m(╯°□°）╯︵ ┻━┻\e[0m")
    IO.puts("\e[90m(introvert):\e[0m \e[91mYou totally had that coming.\e[0m")
    IO.puts("\n\n")
    # enough is enough, kill the extrovert
    Supervisor.terminate_child(Hello.ServerSupervisor, :extrovert)

    # finally the introvert has some time to recharge
    IO.puts("\e[90m(introvert):\e[0m \e[32m(＾▽＾) Blissful silence.\e[0m")

    # but also, specify a future time to apologise and start it again
    Process.send_after(self(), :regret, 5000)

    # reset the state
    {:noreply, 0}
  end

  @impl true
  @doc false
  def handle_info(:hello, state) do
    # the introvert speaks inside his own head - which is the terminal.
    cond do
      state == 0 ->
        IO.puts("\e[90m(introvert):\e[0m \e[32m(＾▽＾) Please, be quiet.\e[0m")

      state < 3 ->
        IO.puts("\e[90m(introvert):\e[0m \e[94m(¬‿¬) Again, please, be quiet.\e[0m")

      state < 5 ->
        IO.puts(
          "\e[90m(introvert):\e[0m \e[93m(ಠ_ಠ) Mate, for the #{state}th time - SHUT UP.\e[0m"
        )

      true ->
        IO.puts(
          "\e[90m(introvert):\e[0m \e[38;2;255;165;0m(╬ಠ益ಠ) Am getting proper radgey me like.\e[0m"
        )
    end

    # now return the correct response and the updated state
    {:noreply, state + 1}
  end
end

defmodule Hello.ServerSupervisor do
  @moduledoc """
  The **ServerSupervisor** manages two interacting GenServers:
  an **Introvert server** and an **Extrovert server**.

  This setup demonstrates **process supervision** and **inter-process communication**:

  - The **Introvert server** prefers peace and quiet, escalating when disturbed.
  - The **Extrovert server** energetically sends greetings.
  - When the introvert reaches its limit, it **terminates the extrovert process**.

  This showcases how **supervisors** handle **fault tolerance** and **restarts** in Elixir.

  ## Supervision Strategy

  - Uses `:one_for_one`: if a child process crashes, **only that process** is restarted.
  - The **extrovert** process is given a custom child spec with `id: :extrovert` for
    **easy identification and control**.
  """
  use Supervisor

  @doc """
  Starts the **ServerSupervisor**, which in turn starts the
  **Introvert** and **Extrovert** servers.
  """
  def start_link() do
    IO.puts("Starting THE supervisor...")
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      # basic specification for supervising, no fuss no muss. Harder to
      # control down the line though. In our use case this is fine.
      # (default ID = module name)
      Hello.IntrovertServer,

      # However the extrovert server needs to be handled gracefully.
      # and setting the spec for the server like this allows the server
      # to have an id of our choosing, which makes it nicer to restart.
      Supervisor.child_spec({Hello.ExtrovertServer, []}, id: :extrovert)
    ]

    # aces - start the supervisor
    # https://hexdocs.pm/elixir/Supervisor.html#module-strategies
    Supervisor.init(children, strategy: :one_for_one)
  end
end

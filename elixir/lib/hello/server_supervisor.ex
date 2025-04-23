defmodule Hello.ServerSupervisor do
  @moduledoc """
  The supervisor controls two servers, one is an introvert
  and the other is an extrovert. The aim is to demonstate
  how processes can be managed by a supervisor but how they
  can also interact.

  When the introvert has had enough of the extrover, it kills
  the process.
  """
  use Supervisor

  def start_link() do
   IO.puts "Starting THE supervisor..."
   Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      # basic specification for supervising, no fuss no muss. Harder to
      # control down the line though. In our use case this is fine.
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

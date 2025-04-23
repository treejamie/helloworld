defmodule Hello.World do

  use Application

  def start(_type, _args) do
    IO.puts "Starting the Hello World application ..."
    Hello.ServerSupervisor.start_link()
  end

end

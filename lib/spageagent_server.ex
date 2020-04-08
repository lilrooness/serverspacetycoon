defmodule SpageagentServer do
  @moduledoc """
  Starts SpaceagentServer Application.
  """
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: SpaceagentServer.Router),
      %{
        id: :world,
        start: {SpaceagentServer.World, :start_link, []}
      }
    ]

    opts = [strategy: :one_for_one, name: SpageagentServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # defp dispatch do
  #   [
  #     {:_,
  #      [
  #        #  {"/ws", MyApp.SocketHandler, []},
  #        {:_, Plug.Adapters.Cowboy.Handler, {SpaceagentServer.Router, []}}
  #      ]}
  #   ]
  # end
end

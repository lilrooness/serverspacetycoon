defmodule SpageagentServer do
  @moduledoc """
  Starts SpaceagentServer Application.
  """
  use Application

  def start() do
    start([], [])
  end

  def start(_, _) do
    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: SpaceagentServer.Router, dispatch: dispatch()),
      %{
        id: :world,
        start: {SpaceagentServer.World, :start_link, []}
      }
    ]

    opts = [strategy: :one_for_one, name: SpageagentServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/ws", SpaceagentServer.WebsocketHandler, []},
         {:_, Plug.Cowboy.Handler, {SpaceagentServer.Router, []}}
       ]}
    ]
  end
end

defmodule SpaceagentServer.Router do
  @moduledoc """
  Routes HTTP Requests
  """
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  match "/data" do
    {:ok, data} = SpaceagentServer.World.get_data()

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(data))
  end
end

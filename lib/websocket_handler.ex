defmodule SpaceagentServer.WebsocketHandler do
  @behaviour :cowboy_websocket

  def init(req, state) do
    IO.inspect("websocket connection received")

    {:cowboy_websocket, req, state}
  end

  def websocket_init(state) do
    {:ok, state}
  end

  def websocket_handle(frame = {:text, data}, state) do
    {:ok, state}
  end
end

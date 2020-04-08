defmodule SpaceagentServer.World do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    path = :erlang.list_to_binary(:code.priv_dir(:spageagent_server)) <> "/world.json"
    data = File.read!(path)
    state = Poison.decode!(data)
    {:ok, state}
  end

  def handle_call(:get_data, _from, state) do
    {:reply, {:ok, state}, state}
  end

  def get_data() do
    GenServer.call(__MODULE__, :get_data)
  end
end

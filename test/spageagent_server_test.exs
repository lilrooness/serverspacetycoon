defmodule SpageagentServerTest do
  use ExUnit.Case
  doctest SpageagentServer

  test "greets the world" do
    assert SpageagentServer.hello() == :world
  end
end

defmodule MessageSharingTest do
  use ExUnit.Case
  doctest MessageSharing

  test "greets the world" do
    assert MessageSharing.hello() == :world
  end
end

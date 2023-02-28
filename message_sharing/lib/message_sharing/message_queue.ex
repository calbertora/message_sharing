defmodule MessageSharing.MessageQueue do
  @queue []

  def add(message) do
    {:ok, [@queue ++ [message]]}
  end

  def pop() do
    case @queue do
      [] -> {:error, "Empty"}
      [h | t] -> {:ok, h, t}
    end
  end
end

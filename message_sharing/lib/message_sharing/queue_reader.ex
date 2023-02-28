defmodule MessageSharing.QueueReader do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    {:ok, []}
  end

  def handle_info({:message, body}, state) do
    IO.puts("Received message: #{body}")
    {:noreply, state}
  end
end

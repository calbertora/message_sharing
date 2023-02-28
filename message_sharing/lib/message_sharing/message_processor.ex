defmodule MessageSharing.MessageProcessor do
  use GenServer

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def handle_info(:process, state) do
    case MessageQueue.pop() do
      {:ok, message, _} ->
        IO.puts "Processing message #{inspect message}"
        {:noreply, nil}

      {:error, _} ->
        IO.puts "Empty Queue"
        {:noreply, nil}
    end
  end
end

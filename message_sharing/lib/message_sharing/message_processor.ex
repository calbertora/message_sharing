defmodule MessageSharing.MessageProcessor do
  use GenServer

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def process(message) do
    GenServer.call(__MODULE__, {:process, message})
  end

  def handle_call({:process, message}, _from, state) do
    case MessageQueue.pop() do
      nil ->
        {:reply, "No message to process", state}

      {:ok, _pid, msg} when msg == message ->
        {:reply, "Message processed successfully", state}

      {:ok, _pid, msg} ->
        MessageQueue.add(msg)
        {:reply, "Message not available to process, added to queue", state}

      {:error, _reason} ->
        {:reply, "Error processing message", state}
    end
  end
end

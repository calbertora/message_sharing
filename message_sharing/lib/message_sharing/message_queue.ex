defmodule MessageSharing.MessageQueue do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def add(message) do
    GenServer.cast(__MODULE__, {:add, message})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  def handle_cast({:add, message}, state) do
    {:noreply, [state | message]}
  end

  def handle_call(:pop, _from, [h | t]) do
    {:reply, {:ok, h}, t}
  end

  def handle_call(:pop, _from, []) do
    {:noreply, nil}
  end

  def stop do
    GenServer.cast(__MODULE__, :stop)
  end

end

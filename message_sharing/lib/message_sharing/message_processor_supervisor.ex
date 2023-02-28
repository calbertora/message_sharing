defmodule MessageProcessorSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(init_arg) do
    children = [
      worker(MessageSharing.Processor, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

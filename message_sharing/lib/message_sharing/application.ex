defmodule MessageSharing.Application do
  use Application

  def start(_type, _args) do
    children = [
      {MessageSharing.MessageProcessor}
    ]

    ops = [strategy: :one_for_one, name: MessageSharing.Supervisor]

    Supervisor.start_link(children, ops)
  end
end

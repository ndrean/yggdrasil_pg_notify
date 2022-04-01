defmodule YggdrasilPgNotify.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      YggdrasilPgNotify.Repo,
      YggdrasilPgNotify.Subscriber,
      YggdrasilPgNotify.Listener,
      {Postgrex.Notifications,
       name: YggdrasilPgNotify.Notifications, database: "yggdrasil_pg_notify"},
      # Start the Telemetry supervisor
      YggdrasilPgNotifyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: YggdrasilPgNotify.PubSub},
      # Start the Endpoint (http/https)
      YggdrasilPgNotifyWeb.Endpoint
      # Start a worker by calling: YggdrasilPgNotify.Worker.start_link(arg)
      # {YggdrasilPgNotify.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: YggdrasilPgNotify.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YggdrasilPgNotifyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

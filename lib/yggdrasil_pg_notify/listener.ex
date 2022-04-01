defmodule YggdrasilPgNotify.Listener do
  use GenServer
  @derive [Poison.Encoder]

  alias YggdrasilPgNotify.{Book, Repo}
  require Logger

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts)

  @impl true
  def init(opts) do
    with {:ok, _pid, _ref} <- Repo.listen("new books") do
      IO.puts("listening....")
      {:ok, opts}
    else
      error -> {:stop, error}
    end
  end

  @impl true
  def handle_info({:notification, _pid, _ref, "new books", payload}, _state) do
    with {:ok, data} <- Poison.decode(payload, keys: :atoms) do
      Logger.info(data)
      IO.inspect(data)
      {:noreply, data}
    else
      error -> {:stop, error, []}
    end
  end
end

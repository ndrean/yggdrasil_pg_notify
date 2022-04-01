defmodule YggdrasilPgNotify.Subscriber do
  use Yggdrasil

  require Logger

  def start_link(options \\ []) do
    channel = [
      name: "new_books",
      adapter: :postgres,
      transformer: :json
    ]

    Yggdrasil.start_link(__MODULE__, [channel], options)
  end

  @impl true
  def handle_event(channel, %{"id" => _id, "title" => title}, _state) do
    if channel == 'new_books' do
      IO.inspect(channel)
      IO.inspect(title)
    end

    {:ok, nil}
  end
end

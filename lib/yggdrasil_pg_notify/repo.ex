defmodule YggdrasilPgNotify.Repo do
  use Ecto.Repo,
    otp_app: :yggdrasil_pg_notify,
    adapter: Ecto.Adapters.Postgres

  def listen(channel) do
    with {:ok, pid} <- Postgrex.Notifications.start_link(__MODULE__.config()),
         {:ok, ref} <- Postgrex.Notifications.listen(pid, channel) do
      {:ok, pid, ref}
    end
  end
end

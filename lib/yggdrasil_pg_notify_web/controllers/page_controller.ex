defmodule YggdrasilPgNotifyWeb.PageController do
  use YggdrasilPgNotifyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

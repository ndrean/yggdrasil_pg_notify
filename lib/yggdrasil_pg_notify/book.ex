defmodule YggdrasilPgNotify.Book do
  use Ecto.Schema

  # @primary_key {:id, :binary_id, autogenerate: true}

  schema "books" do
    # field(:id, :integer)
    field(:title, :string)
  end
end

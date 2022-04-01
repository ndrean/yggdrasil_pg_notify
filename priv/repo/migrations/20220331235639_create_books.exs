defmodule YggdrasilPgNotify.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:books) do
      add(:title, :string)
      # timestamps()
    end
  end
end

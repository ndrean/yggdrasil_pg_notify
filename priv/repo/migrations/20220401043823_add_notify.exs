defmodule YggdrasilPgNotify.Repo.Migrations.AddNotify do
  use Ecto.Migration

  def down do
    execute("
      DROP TRIGGER IF EXISTS books_notify_new_book ON books
    ")
  end

  def up do
    execute("
      CREATE TRIGGER books_notify_new_book
        AFTER INSERT OR UPDATE
        ON books
        FOR EACH ROW
        EXECUTE PROCEDURE trigger_new_book();
    ")
  end
end

defmodule YggdrasilPgNotify.Repo.Migrations.AddPostgresTriggers do
  use Ecto.Migration

  def down do
  end

  def up do
    execute "
      CREATE OR REPLACE FUNCTION trigger_new_book()
        RETURNS TRIGGER AS $$
        DECLARE
          payload JSON;
        BEGIN
          payload := json_build_object(
            'id', NEW.id,
            'title', NEW.title
          );

          PERFORM pg_notify('new_books', payload::TEXT);
          RETURN NEW;
        END;
        $$
      LANGUAGE plpgsql;
    "
  end
end

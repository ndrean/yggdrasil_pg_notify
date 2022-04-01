# YggdrasilPgNotify

```bash
mix phx.new yggdrasil_pg_notify

mix ecto.gen.repo -r YggdrasilPgNotify.Repo

mix ecto.gen.migration create_books
mix ecto.gen.migration add_postgres_triggers

mix ecto.create
mix ecto.migrate

```

## sources

- Postgrex.Notification (with a model)
<https://blog.lelonek.me/listen-and-notify-postgresql-commands-in-elixir-187c49597851>

- Yggdrasil
<https://thebroken.link/yggdrasil-easy-pub-sub-in-elixir/#0 >

- insert triggers with migrations
<https://gist.github.com/carterbryden/e7b19d1ba1ea92e241fed259fea23491  >

<https://stackoverflow.com/questions/59188077/how-to-correctly-pass-postgrex-notifications-to-a-supervisor>

## test

```bash
$ psql -U postgres
postgres=# \c mydb
mydb=# NOTIFY "new books", '{"id": 1, "title": "one"}';


$ iex -S mix phx.server
listening...
iex>  [info] [id: 1, title: "one"]
```
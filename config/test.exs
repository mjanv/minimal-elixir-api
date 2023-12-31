import Config

config :pokemons, Pokemons.Repo,
  database: Path.expand("../pokemons_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

config :pokemons, PokemonsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NrI50rfL4dpa4yv7iINlvvww4Yw8ufm+VpuLiaVvxiKV2vQ1rgnk71gFbX1qGR+o",
  server: false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime

import Config

config :pokemons, Pokemons.Repo,
  database: Path.expand("../pokemons_dev.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :pokemons, PokemonsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: false,
  debug_errors: true,
  secret_key_base: "90tX6+JFjTqAfGAsvdD8Ep46p4jUodlh6yVuQAn8mRIghi+Xifkl57Ai26v2eWhd",
  watchers: []

config :pokemons, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

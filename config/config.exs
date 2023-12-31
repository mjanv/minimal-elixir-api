import Config

config :pokemons,
  ecto_repos: [Pokemons.Repo],
  generators: [timestamp_type: :utc_datetime]

config :pokemons, PokemonsWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: PokemonsWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Pokemons.PubSub,
  live_view: [signing_salt: "of1Y9Yv9"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"

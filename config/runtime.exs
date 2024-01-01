import Config

if System.get_env("PHX_SERVER") do
  config :pokemons, PokemonsWeb.Endpoint, server: true
end

if config_env() == :prod do
  database_path =
    System.get_env("DATABASE_PATH") ||
      raise """
      environment variable DATABASE_PATH is missing.
      For example: /etc/pokemons/pokemons.db
      """

  config :pokemons, Pokemons.Repo,
    database: database_path,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "5")

  config :pokemons, PokemonsWeb.Endpoint,
    url: [
      host: System.get_env("PHX_HOST") || "example.com",
      port: 443,
      scheme: "https"
    ],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ],
    secret_key_base:
      System.get_env("SECRET_KEY_BASE") ||
        raise("environment variable SECRET_KEY_BASE is missing")
end

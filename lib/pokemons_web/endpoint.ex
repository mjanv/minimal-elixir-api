defmodule PokemonsWeb.Endpoint do
  @moduledoc false

  use Phoenix.Endpoint, otp_app: :pokemons

  @session_options [
    store: :cookie,
    key: "_pokemons_key",
    signing_salt: "MktTHTkZ",
    same_site: "Lax"
  ]

  plug Plug.Static,
    at: "/",
    from: :pokemons,
    gzip: false,
    only: PokemonsWeb.static_paths()

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug PokemonsWeb.Router
end

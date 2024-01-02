defmodule PokemonsWeb.Endpoint do
  @moduledoc false

  use Phoenix.Endpoint, otp_app: :pokemons

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

  plug Plug.Session,
    store: :cookie,
    key: "_pokemons_key",
    signing_salt: "MktTHTkZ",
    same_site: "Lax"

  plug PokemonsWeb.Router

  socket "/socket", PokemonsWeb.Channels.Socket,
    websocket: true,
    longpoll: false
end

defmodule Pokemons.Repo do
  use Ecto.Repo,
    otp_app: :pokemons,
    adapter: Ecto.Adapters.SQLite3
end

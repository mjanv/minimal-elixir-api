defmodule Pokemons.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :pokemons,
    adapter: Ecto.Adapters.SQLite3
end

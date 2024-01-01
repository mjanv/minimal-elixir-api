defmodule Pokemons do
  @moduledoc false

  def count_pokemons do
    :telemetry.execute(
      [:pokemons, :pokedex],
      %{total: Pokemons.Pokedex.count_pokemons()},
      %{}
    )
  end
end

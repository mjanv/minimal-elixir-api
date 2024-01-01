defmodule PokemonsWeb.Controllers.Pokemons.PokemonJSON do
  @moduledoc false

  alias Pokemons.Pokedex.Pokemon

  @doc """
  Renders a list of pokemons.
  """
  def index(%{pokemons: pokemons}) do
    %{data: Enum.map(pokemons, &data/1)}
  end

  @doc """
  Renders a single pokemon.
  """
  def show(%{pokemon: pokemon}) do
    %{data: data(pokemon)}
  end

  defp data(%Pokemon{} = pokemon) do
    %{
      id: pokemon.id,
      number: pokemon.number,
      name: pokemon.name,
      type: pokemon.type
    }
  end
end

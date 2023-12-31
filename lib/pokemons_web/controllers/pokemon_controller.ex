defmodule PokemonsWeb.PokemonController do
  use PokemonsWeb, :controller

  alias Pokemons.Pokedex
  alias Pokemons.Pokedex.Pokemon

  action_fallback PokemonsWeb.FallbackController

  def index(conn, _params) do
    pokemons = Pokedex.list_pokemons()
    render(conn, :index, pokemons: pokemons)
  end

  def create(conn, %{"pokemon" => pokemon_params}) do
    with {:ok, %Pokemon{} = pokemon} <- Pokedex.create_pokemon(pokemon_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pokemons/#{pokemon}")
      |> render(:show, pokemon: pokemon)
    end
  end

  def show(conn, %{"id" => id}) do
    pokemon = Pokedex.get_pokemon!(id)
    render(conn, :show, pokemon: pokemon)
  end

  def update(conn, %{"id" => id, "pokemon" => pokemon_params}) do
    pokemon = Pokedex.get_pokemon!(id)

    with {:ok, %Pokemon{} = pokemon} <- Pokedex.update_pokemon(pokemon, pokemon_params) do
      render(conn, :show, pokemon: pokemon)
    end
  end

  def delete(conn, %{"id" => id}) do
    pokemon = Pokedex.get_pokemon!(id)

    with {:ok, %Pokemon{}} <- Pokedex.delete_pokemon(pokemon) do
      send_resp(conn, :no_content, "")
    end
  end
end

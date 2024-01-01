defmodule PokemonsWeb.Controllers.Pokemons.PokemonController do
  @moduledoc false

  use PokemonsWeb, :controller

  alias Pokemons.Pokedex
  alias Pokemons.Pokedex.Pokemon

  action_fallback PokemonsWeb.Controllers.FallbackController

  def index(conn, _params) do
    pokemons = Pokedex.list_pokemons()
    render(conn, :index, pokemons: pokemons)
  end

  def create(conn, %{"pokemon" => params}) do
    with {:ok, %Pokemon{} = pokemon} <- Pokedex.create_pokemon(params) do
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

  def update(conn, %{"id" => id, "pokemon" => params}) do
    pokemon = Pokedex.get_pokemon!(id)

    with {:ok, %Pokemon{} = pokemon} <- Pokedex.update_pokemon(pokemon, params) do
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

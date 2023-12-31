defmodule PokemonsWeb.Router do
  @moduledoc false

  use PokemonsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PokemonsWeb do
    pipe_through :api

    resources "/pokemons", Controllers.Pokemons.PokemonController, except: [:new, :edit, :update]
  end
end

defmodule PokemonsWeb.Router do
  use PokemonsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PokemonsWeb do
    pipe_through :api
  end
end

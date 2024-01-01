defmodule Pokemons.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Pokemons.Supervisor,
      PokemonsWeb.Supervisor
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Pokemons.Application.Supervisor)
  end
end

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

  @impl true
  def config_change(changed, _new, removed) do
    PokemonsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

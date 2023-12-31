defmodule PokemonsWeb.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [
      Pokemons.Repo,
      {Ecto.Migrator,
       repos: Application.fetch_env!(:pokemons, :ecto_repos), skip: skip_migrations?()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp skip_migrations? do
    System.get_env("RELEASE_NAME") != nil
  end
end

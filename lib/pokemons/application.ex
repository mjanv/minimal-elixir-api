defmodule Pokemons.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PokemonsWeb.Telemetry,
      Pokemons.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:pokemons, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:pokemons, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pokemons.PubSub},
      PokemonsWeb.Endpoint
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Pokemons.Supervisor)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PokemonsWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    System.get_env("RELEASE_NAME") != nil
  end
end

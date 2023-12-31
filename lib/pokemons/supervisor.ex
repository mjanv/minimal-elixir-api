defmodule Pokemons.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [
      PokemonsWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:pokemons, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pokemons.PubSub},
      PokemonsWeb.Endpoint
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

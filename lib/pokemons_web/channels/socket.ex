defmodule PokemonsWeb.Channels.Socket do
  @moduledoc false

  use Phoenix.Socket

  channel "pokedex", PokemonsWeb.Channels.Pokemons.PokedexChannel

  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end

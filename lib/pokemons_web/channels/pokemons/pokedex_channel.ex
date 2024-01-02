defmodule PokemonsWeb.Channels.Pokemons.PokedexChannel do
  @moduledoc false

  use PokemonsWeb, :channel

  @topic "pokedex"

  @impl true
  def join(@topic, _payload, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_in(_msg, _payload, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_info({event, message}, socket) do
    push(socket, Atom.to_string(event), message)
    {:noreply, socket}
  end

  def broadcast(event, message) do
    Phoenix.PubSub.broadcast(Pokemons.PubSub, @topic, {event, message})
  end
end

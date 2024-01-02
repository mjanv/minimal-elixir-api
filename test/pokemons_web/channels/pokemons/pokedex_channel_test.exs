defmodule PokemonsWeb.Channels.PokedexChannelTest do
  @moduledoc false

  use PokemonsWeb.ChannelCase

  alias PokemonsWeb.Channels.{Pokemons.PokedexChannel, Socket}

  setup do
    Socket
    |> socket()
    |> subscribe_and_join(PokedexChannel, "pokedex")
    |> then(fn {:ok, _, socket} -> %{socket: socket} end)
  end

  test "Events can be broadcasted to clients connected to the pokedex topic", %{socket: _socket} do
    PokedexChannel.broadcast(:event, %{count: 5})
    assert_push "event", %{count: 5}
  end
end

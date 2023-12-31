defmodule Pokemons.PokedexTest do
  use Pokemons.DataCase

  alias Pokemons.Pokedex

  describe "pokemons" do
    alias Pokemons.Pokedex.Pokemon

    import Pokemons.PokedexFixtures

    @invalid_attrs %{name: nil, type: nil, number: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Pokedex.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Pokedex.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{name: "some name", type: "some type", number: 42}

      assert {:ok, %Pokemon{} = pokemon} = Pokedex.create_pokemon(valid_attrs)
      assert pokemon.name == "some name"
      assert pokemon.type == "some type"
      assert pokemon.number == 42
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokedex.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", number: 43}

      assert {:ok, %Pokemon{} = pokemon} = Pokedex.update_pokemon(pokemon, update_attrs)
      assert pokemon.name == "some updated name"
      assert pokemon.type == "some updated type"
      assert pokemon.number == 43
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokedex.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Pokedex.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Pokedex.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Pokedex.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Pokedex.change_pokemon(pokemon)
    end
  end
end

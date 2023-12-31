defmodule PokemonsWeb.Controllers.PokemonControllerTest do
  @moduledoc false

  use PokemonsWeb.ConnCase

  import Pokemons.PokedexFixtures

  @create_attrs %{
    name: "some name",
    type: "some type",
    number: 42
  }

  @invalid_attrs %{name: nil, type: nil, number: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pokemons", %{conn: conn} do
      conn = get(conn, ~p"/api/pokemons")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pokemon" do
    test "renders pokemon when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pokemons", pokemon: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pokemons/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "number" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pokemons", pokemon: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pokemon" do
    setup [:create_pokemon]

    test "deletes chosen pokemon", %{conn: conn, pokemon: pokemon} do
      conn = delete(conn, ~p"/api/pokemons/#{pokemon}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pokemons/#{pokemon}")
      end
    end
  end

  defp create_pokemon(_) do
    pokemon = pokemon_fixture()
    %{pokemon: pokemon}
  end
end

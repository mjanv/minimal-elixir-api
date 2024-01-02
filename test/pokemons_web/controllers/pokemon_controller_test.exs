defmodule PokemonsWeb.Controllers.PokemonsTest do
  @moduledoc false

  use PokemonsWeb.ConnCase

  import Pokemons.PokedexFixtures

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pokemons", %{conn: conn} do
      conn = get(conn, ~p"/api/pokemons")

      response = json_response(conn, 200)
      assert response["data"] == []
    end
  end

  describe "create pokemon" do
    test "renders pokemon when data is valid", %{conn: conn} do
      attrs = %{name: "some name", type: "some type", number: 42}

      conn = post(conn, ~p"/api/pokemons", pokemon: attrs)
      %{"id" => id} = json_response(conn, 201)["data"]
      conn = get(conn, ~p"/api/pokemons/#{id}")

      response = json_response(conn, 200)

      assert response["data"] == %{
               "id" => id,
               "name" => "some name",
               "number" => 42,
               "type" => "some type"
             }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      attrs = %{name: nil, type: nil, number: nil}

      conn = post(conn, ~p"/api/pokemons", pokemon: attrs)

      response = json_response(conn, 422)
      assert response["errors"] != %{}
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

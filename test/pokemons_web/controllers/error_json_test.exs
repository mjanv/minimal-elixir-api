defmodule PokemonsWeb.Controllers.ErrorJSONTest do
  @moduledoc false

  use PokemonsWeb.ConnCase, async: true

  alias PokemonsWeb.Controllers

  test "renders 404" do
    assert Controllers.ErrorJSON.render("404.json", %{}) == %{
             errors: %{detail: "Not Found"}
           }
  end

  test "renders 500" do
    assert Controllers.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

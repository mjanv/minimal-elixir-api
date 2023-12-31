defmodule Pokemons.Pokedex.Pokemon do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :name, :string
    field :type, :string
    field :number, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:number, :name, :type])
    |> validate_required([:number, :name, :type])
  end
end

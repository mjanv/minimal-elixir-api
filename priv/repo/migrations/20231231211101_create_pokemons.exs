defmodule Pokemons.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :number, :integer
      add :name, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end

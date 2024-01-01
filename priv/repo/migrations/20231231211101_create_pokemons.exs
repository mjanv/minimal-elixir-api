defmodule Pokemons.Repo.Migrations.CreatePokemons do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :number, :integer
      add :name, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end

    create index(:pokemons, [:number])
  end
end

starter_pack = [
  %{number: 1, name: "Bulbizarre", type: "Plante"},
  %{number: 4, name: "Salamèche", type: "Feu"},
  %{number: 7, name: "Carapuce", type: "Eau"}
]

for pokemon <- starter_pack do
  Pokemons.Pokedex.create_pokemon(pokemon)
end

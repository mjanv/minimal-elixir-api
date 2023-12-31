# Minimal JSON API for Elixir

This repository is a minimal Elixir appplication deploying a simple JSON API written in Elixir using the [Phoenix framework](https://hexdocs.pm/phoenix). The repository is compatible with Phoenix versions higher than `1.7`. You can put this in production, at your risk, but it will bring zero value to your product.

## Application setup

The application has been setup using the following steps:

```
mix phx.new . --app pokemons --module Pokemons --database sqlite3 --no-assets --no-dashboard --no-esbuild --no-gettext --no-html --no-mailer --no-tailwind
```

```
mix deps.get
mix phx.server
```

```
mix phx.gen.json Pokedex Pokemon pokemons number:integer name:string type:string
```

```
Add the resource to your :api scope in lib/pokemons_web/router.ex:

    resources "/pokemons", PokemonController, except: [:new, :edit]
```

```
mix ecto.migrate
```

```
curl -i http://localhost:4000/api/pokemons
```

```
curl -iX POST http://localhost:4000/api/pokemons -H 'Content-Type: application/json' -d '{"pokemon": {"number": 25, "name": "Pikachu", "type": "electric"}}'

curl -iX POST http://localhost:4000/api/pokemons -H 'Content-Type: application/json' -d '{"pokemon": {"number": 1, "name": "Bulbizarre", "type": "plant"}}'

curl -iX DELETE http://localhost:4000/api/pokemons/2
```

## Ressources

All the content written in this repository have been created using those ressources:

- [Phoenix documentation, JSON and APIs](https://hexdocs.pm/phoenix/json_and_apis.html)
- [Phoenix documentation, mix phx.gen.json](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Json.html)
- [Phoenix documentation, Routing - Ressources](https://hexdocs.pm/phoenix/routing.html#resources)
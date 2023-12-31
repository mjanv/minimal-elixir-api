# Minimal JSON API for Elixir

This repository is a minimal Elixir appplication deploying a simple JSON API written in Elixir using the [Phoenix framework](https://hexdocs.pm/phoenix). The repository is compatible with Phoenix versions higher than `1.7`. 

The API is capable to add and return basic informations about Pokemons. You can put this in production, at your risk, but it will bring zero value to your product.

## Application setup

The application has been setup using the following steps. First, you can create the project using `mix phx.new` by removing all options related to HTML views, JS, mails,... The database is setup using SQLite 3.

```bash
mkdir minimal-elixir-api
cd minimal-elixir-api/
mix phx.new . --app pokemons --module Pokemons --database sqlite3 --no-assets --no-dashboard --no-esbuild --no-gettext --no-html --no-mailer --no-tailwind
```

From there, the server can already be started using:

```bash
mix deps.get
mix phx.server
```

You can add a `Pokedex` context defining what is a `Pokemon` (plural `pokemons`), with `number`, `name` and `type` attributes. Using this command, you will create the context (Ecto schema, Ecto migration), the controller and the JSON view.

```bash
mix phx.gen.json Pokedex Pokemon pokemons number:integer name:string type:string
```

Read the instructions generated and don't forget to do this.

```
Add the resource to your :api scope in lib/pokemons_web/router.ex:

    resources "/pokemons", PokemonController, except: [:new, :edit]
```

Migrate the database *(no need for Docker-related complexity, we are using straight SQLite 3)*:

```bash
mix ecto.migrate
```

the server can be (re)started using:

```bash
mix deps.get
mix phx.server
```

## Use the API

Navigate to `http://localhost:4000/`, you will display an error page displaying all available route in the API.

All pokemons can be listed using a GET request:

```bash
curl -i http://localhost:4000/api/pokemons
```

New pokemons can be added using POST requests:

```bash
curl -iX POST http://localhost:4000/api/pokemons -H 'Content-Type: application/json' -d '{"pokemon": {"number": 25, "name": "Pikachu", "type": "electric"}}'

curl -iX POST http://localhost:4000/api/pokemons -H 'Content-Type: application/json' -d '{"pokemon": {"number": 1, "name": "Bulbizarre", "type": "plant"}}'
```

Pokemons can be deleted using DELETE requests:

```bash
curl -iX DELETE http://localhost:4000/api/pokemons/1
curl -iX DELETE http://localhost:4000/api/pokemons/2
```

## Development

```bash
mix format # Format the code
mix credo --strict # Static code analysis
mix test # Unit tests
```

## Ressources

All the content written in this repository have been created using those ressources:

- [Phoenix documentation, JSON and APIs](https://hexdocs.pm/phoenix/json_and_apis.html)
- [Phoenix documentation, mix phx.gen.json](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Json.html)
- [Phoenix documentation, Routing - Ressources](https://hexdocs.pm/phoenix/routing.html#resources)
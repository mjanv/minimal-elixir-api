# Application scaffolding

## JSON API

The application has been setup using the following steps. 

1. you can create the project using `mix phx.new` by removing all options related to HTML views, JS, mails,... The database is setup using SQLite 3.

```bash
mkdir minimal-elixir-api
cd minimal-elixir-api/
mix phx.new . --app pokemons --module Pokemons --database sqlite3 --no-assets --no-dashboard --no-esbuild --no-gettext --no-html --no-mailer --no-tailwind
```

From there, the server can already be started using:

```bash
mix setup
mix phx.server
```

2. You can add a `Pokedex` context defining what is a `Pokemon` (plural `pokemons`), with `number`, `name` and `type` attributes. As you are using the `phx.gen.json` command, you will create the context (Ecto schema, Ecto migration), the controller and the JSON view at once.

```bash
mix phx.gen.json Pokedex Pokemon pokemons number:integer name:string type:string
```

Read the instructions generated and don't forget to do this.

```
Add the resource to your :api scope in lib/pokemons_web/router.ex:

    resources "/pokemons", PokemonController, except: [:new, :edit]
```

3. Migrate the database *(no need for Docker-related complexity, we are using straight SQLite 3)*:

```bash
mix ecto.migrate
```

the server can be (re)started using:

```bash
mix setup
mix phx.server
```

All those instructions are enough to create a valid working project. If you read closely the repository, you will see that some naming and structures have changed to match my approach of Elixir development (`application.ex` at root, one supervisor per folder/context, module naming matching folder structure,...).

## Real-time API

An API capable to push events in real-time can be built using Websockets. To enable this, you must setup the following steps.

1. Build a socket handler by using the command

```bash
mix phx.gen.socket Pokedex
```

```bash
Add the socket handler to your `lib/pokemons_web/endpoint.ex`, for example:

    socket "/socket", PokemonsWeb.PokedexSocket,
      websocket: true,
      longpoll: false
```

2. Build a channel by using the command

```bash
mix phx.gen.channel Pokedex
```

The javascript file generated in `assets/` can be deleted.

All those instructions are enough the basic structure. Some naming and structures have changed to match my approach of Elixir development (sockets definition in `*_web/channels/` folder, channels definition in `*_web/channels/<context>/<context>_channel.ex`, a `broadcast()` function defined per channel,...)
# Deployment

You can deploy by either using an [Erlang release](#deploy-using-an-erlang-release) or by using a [Docker container](#deploy-using-a-dockerfile). Pick your sword. Both deployments use the `prod` configuration.

For both deployments, create an environnment file `.env` with this content:

```bash
SECRET_KEY_BASE=h3x6k7JMU/zNgsBZKtDyj9KHLrmDp76bbvp6cFdAWFod/BkJjUd2bLYaVlRRYnVi
DATABASE_PATH=data/pokemons.db
```

The secret key base can be regenerated using `mix phx.gen.secret`.

## Deploy using an Erlang release

You can create the minimal `rel/` folder using,

```bash
mix phx.gen.release --docker
```

Build the release binary using,

```bash
source .env
MIX_ENV=prod mix release
```

And you can start the server with,

```bash
source .env
PHX_SERVER=true _build/prod/rel/pokemons/bin/pokemons start
```

## Deploy using a Dockerfile

You can create the minimal `Dockerfile` and `rel/` folder using,

```bash
mix phx.gen.release --docker
```

A `docker-compose.yml` is available to run the application using your preferred way to package anything. Just,

```bash
docker compose up
```

The deployment uses the `prod` configuration.
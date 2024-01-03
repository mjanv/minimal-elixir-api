# Minimal JSON API for Elixir

## Goals

This repository holds a minimal Elixir application deploying a simple JSON API using the [Phoenix framework](https://hexdocs.pm/phoenix). The repository is compatible with Phoenix versions higher than `1.7`. 

The API is capable of two things:

1. deploy a JSON *(REST ?)* API to create and return basic informations about Pokemons (yes, the [Pokemons](https://www.pokemon.com/us/pokedex)). 
2. deploy a Websockets API to push pokemon events to clients connected to the API.

You can put this in production, at your risk, but it will bring zero value to your product.

## Architecture

Overall architecture (editable with [excalidraw](https://excalidraw.com/)) of the entire application is:

![Architecture](docs/architecture.png)

## Guides

- [**Scaffolding**](docs/scaffolding.md) - How to setup easily the JSON and Websockets API ?
- [**API Usage**](docs/api_usage.md) - How to connect to the JSON or Websockets API ?
- [**Deployment**](docs/deployment.md) - How to deploy through Erlang releases and Dockerfiles ?
- [**Ressources**](docs/ressources.md) - What ressources have been used to write this repository ?
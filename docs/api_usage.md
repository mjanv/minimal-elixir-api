# API usage

Start the server:

```bash
mix setup
mix phx.server
```

## JSON API

Navigate to `http://localhost:4000/`, you will display an error page displaying all available route in the API.

All pokemons, or a specific pokemon, can be listed using GET requests:

```bash
curl -i http://localhost:4000/api/pokemons
curl -i http://localhost:4000/api/pokemons/1
```

New pokemons can be added using POST requests:

```bash
curl -iX POST http://localhost:4000/api/pokemons \
    -H 'Content-Type: application/json' \
    -d '{"pokemon": {"number": 25, "name": "Pikachu", "type": "Électrik"}}'
```

Pokemons can be deleted using DELETE requests:

```bash
curl -iX DELETE http://localhost:4000/api/pokemons/1
```

## Websockets API

Connection to the Websockets API can be done using any client. For example, a valid approach in Python would look like this:

```bash
pip install realtime
```

```python
from realtime.connection import Socket

s = Socket("ws://localhost:4000/socket/websocket")
s.connect()

channel = s.set_channel("pokedex")
channel.join().on("count", print)

s.listen()
```

Any event pushed to the client will be displayed in the console. Right now, a `count` event is published when the `api/pokemons` endpoint is called using a GET request.
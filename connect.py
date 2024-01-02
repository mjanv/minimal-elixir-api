from realtime.connection import Socket

s = Socket("ws://localhost:4000/socket/websocket")
s.connect()

channel = s.set_channel("pokedex")
channel.join().on("*", print)

s.listen()
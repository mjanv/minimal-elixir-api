set PHX_SERVER=true

"%~dp0\pokemons" eval Pokemons.Repo.Release.migrate
call "%~dp0\pokemons" start

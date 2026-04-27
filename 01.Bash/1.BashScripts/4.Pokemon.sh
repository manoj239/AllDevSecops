curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq
curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq | more
curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq  ".results"
curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq ".results[].name"
curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq ".results[].name" -r
curl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq ".results[].name" -r | wc -l
curl -sl https://pokeapi.co/api/v2/pokemon?limit=100000 | jq ".results[].name" -r | wc -l

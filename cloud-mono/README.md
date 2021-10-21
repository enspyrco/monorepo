# coding-challenge-verifier

*.*

[Project Notes](https://enspyrco.notion.site/coding-challenge-verifier-c4d552c506a74fddbef4147cbc4f749c)

## Running locally

We can debug with a launch configuration that runs `bin/server.dart`, eg:

```json
{
  "name": "coding_challenge_verifier",
  "request": "launch",
  "type": "dart",
  "program": "bin/server.dart"
},
```

You can use curl to test connecting

```sh
curl http://localhost:8080
```
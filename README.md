To start:

- `docker-compose build`
- `docker-compose up`

The project will be running on localhost:4000

If it complains it can't find a node_moodule after system prune or rebuild: make install

To query GraphQL:

- localhost:4000/graphql - brings up Apollo sandbox
- localhost:4000/playground - brings up GraphQL Playground which lets you view and poke at the schema

const { PrismaClient } = require("@prisma/client");
const { ApolloServer } = require("apollo-server-express");
const express = require("express");
const { readFileSync } = require("fs");
require("dotenv").config();
const resolvers = require("./resolvers");
const expressPlayground =
  require("graphql-playground-middleware-express").default;
const path = require("path");
const prisma = new PrismaClient();

const app = express();

app.use(cors());

async function startServer() {
  const server = new ApolloServer({
    typeDefs: readFileSync(path.join(__dirname, "schema.graphql"), "utf-8"),
    resolvers,
    context: {
      prisma,
    },
  });
  await server.start();
  server.applyMiddleware({ app });
}

startServer();

app.get("/", (req, res) => res.end("Congrats you made it."));
app.get("/playground", expressPlayground({ endpoint: "/graphql" }));

app.listen({ port: process.env.PORT || 4000 }).then(({ url }) => {
  console.log(`
    🚀  Server is ready at ${url}
    📭  Query at https://studio.apollographql.com/dev
  `);
});

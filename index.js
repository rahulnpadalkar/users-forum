const express = require("express");
const { postgraphile } = require("postgraphile");
const app = express();
require("dotenv").config();

app.use(
  postgraphile(process.env.DATABASE_URL, "usersforumpublic", {
    watchPg: true,
    graphiql: true,
    enhanceGraphiql: true,
    jwtPgTypeIdentifier: "usersforumpublic.jwt",
    jwtSecret: "9be9ebfac8ad4bd1b4808b548d0f6c72",
  })
);

app.listen(3000, () => {
  console.log("Server Started");
});

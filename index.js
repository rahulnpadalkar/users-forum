const express = require("express");
const { postgraphile } = require("postgraphile");
const app = express();
require("dotenv").config();

app.use(
  postgraphile(process.env.DATABASE_URL, "usersforumpublic", {
    watchPg: true,
    graphiql: true,
    enhanceGraphiql: true,
  })
);

app.listen(3000, () => {
  console.log("Server Started");
});

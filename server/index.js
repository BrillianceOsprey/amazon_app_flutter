// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

// INIT
const PROT = 3000;
const app = express();

// middleware
// CLIENT -> middleware -> SERVER -> CLIENT
app.use(authRouter);

// Connections
mongoose
  .connect()
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PROT, () => {
  console.log(`connected at port ${PROT}`);
});

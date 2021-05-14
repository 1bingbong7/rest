const express = require("express");
const bodyparser = require("body-parser");
const { mysqlCon } = require("./config/database");
var app = express();
app.use(bodyparser.json());

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Listening on port ${port}..`));

app.use("/api", require("./routes/index")(app));

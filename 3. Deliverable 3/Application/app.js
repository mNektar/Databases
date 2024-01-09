const express = require("express");
const app = express();
const postRoute = require('./routers/posts');
const errorRoute = require('./routers/errors');
const bodyParser = require("body-parser");
const cors=require("cors");
const session = require('express-session');
const userRouter = require('./routers/users');


app.use(cors());

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.use('/', userRouter);

app.use('/', postRoute);

app.use('/', errorRoute);



module.exports = app
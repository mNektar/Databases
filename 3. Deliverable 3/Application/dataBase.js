const mysql = require("mysql2");
const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();

const dataBase = mysql.createConnection({
    host:'127.0.0.1',
    port:'3306',
    user:'root',
    password:'Stormageddon26!',
    database:'LotR'
});

dataBase.connect(function(err) {
  if (err) throw err;
  console.log("DATABASE Connected!");

});





module.exports =
    dataBase;
    // getNameArtifacts,
    // getTitleBooks,
    // getNameCharacters,
    // getNameEvents,
    // getNameGroups,
    // getNameHouses,
    // getTitleMovies,
    // getNameRaces,
    // getNameRegions,
    // getNameTowns
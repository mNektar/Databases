const express = require('express');
const path = require("path");
const database = require("../dataBase");
const router = express.Router();


router.get('/errorArtifact',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorArtifact.html')); });



router.get('/errorTown',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorTown.html')); });


router.get('/errorMovie',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorMovie.html')); });


router.get('/errorBook',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorBook.html')); });


router.get('/errorGroup',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorGroup.html')); });

router.get('/errorCharacter',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorCharacter.html')); });

router.get('/errorEvent',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorEvent.html')); });

router.get('/errorRegion',(req, res) => {
    res.sendFile(path.join(__dirname, '/errorHTMLS/errorRegion.html')); });

module.exports = router;
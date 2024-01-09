const express = require('express');
const postController = require('../controllers/postController');
const path = require("path");
const database = require("../dataBase");
const router = express.Router();
const fs = require('fs');
const searchController = require("../controllers/searchController")
const dataBase = require("../dataBase");

let data1;
let data2;
let data3;
let data4;
let data5;
let data6;
let data7;
let data8;
let data9;
let data10;
let data;


router.post('/search',(req, res) => {
  const searchTerm = req.body.searchTerm;
  console.log(searchTerm);

  const query1 = `SELECT Name FROM lotr.artifacts WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query1, (err, results1) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results1));
    data1=results1;
  });

  const query2 = `SELECT Title FROM lotr.books WHERE Title LIKE '%${searchTerm}%'`;
  dataBase.query(query2, (err, results2) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results2));
    data2=results2;
  });

  const query3 = `SELECT Name FROM lotr.notable_characters WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query3, (err, results3) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results3));
    data3=results3;
  });

  const query4 = `SELECT Name FROM lotr.events WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query4, (err, results4) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results4));
    data4=results4;
  });

   const query5 = `SELECT Name FROM lotr.groups WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query5, (err, results5) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results5));
    data5=results5;
  });

  const query6 = `SELECT Name FROM lotr.houses WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query6, (err, results6) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results6));
    data6=results6;
  });

  const query7 = `SELECT Title FROM lotr.movies WHERE title LIKE '%${searchTerm}%'`;
  dataBase.query(query7, (err, results7) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results7));
    data7=results7;
  });

  const query8 = `SELECT Name FROM lotr.races WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query8, (err, results8) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results8));
    data8=results8;
  });

  const query9 = `SELECT Name FROM lotr.regions WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query9, (err, results9) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results9));
    data9=results9;
    });

  const query10 = `SELECT Name FROM lotr.major_towns_locations WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query10, (err, results10) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    fs.writeFileSync('results.json', JSON.stringify(results10));
    data10=results10;
  });


  res.sendFile(path.join(__dirname, '/search.html'));

});

router.get('/takeSearch',(req, res) => {

  const data  = Object.assign({}, data1,data2, data3,data4,data5,data6,data7,data8,data9,data10);

  data1 = data1.concat(data2);
  data1 = data1.concat(data3);
  data1 = data1.concat(data4);
  data1 = data1.concat(data5);
  data1 = data1.concat(data6);
  data1 = data1.concat(data7);
  data1 = data1.concat(data8);
  data1 = data1.concat(data9);
  data1 = data1.concat(data10);

  console.log(data1);
  res.json(data1);
});

router.get('/search-item' ,(req, res) => {
  let searchTerm = document.getElementById('searchInput').value;
  postController.search(searchTerm);
});



router.get('/artifacts',(req, res) => {
  res.sendFile(path.join(__dirname, '/artifacts.html')); });

router.get('/getArtifacts',postController.getArtifacts);

router.get('/postArtifact',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addArtifact.html')); });

router.post('/addArtifact',postController.postArtifact);




router.get('/books',(req, res) => {
  res.sendFile(path.join(__dirname, '/books.html')); });

router.get('/getBooks',postController.getBooks);

router.get('/postBook',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addBook.html')); });

router.post('/addBook',postController.postBook);




router.get('/events',(req, res) => {
  res.sendFile(path.join(__dirname, '/events.html')); });

router.get('/getEvents',postController.getEvents);

router.get('/postEvent',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addEvent.html')); });

router.post('/addEvent',postController.postEvent);



router.get('/groups',(req, res) => {
  res.sendFile(path.join(__dirname, '/groups.html')); });

router.get('/getGroups',postController.getGroups);

router.get('/postGroup',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addGroup.html')); });

router.post('/addGroup',postController.postGroup);



router.get('/houses',(req, res) => {
  res.sendFile(path.join(__dirname, '/houses.html')); });

router.get('/getHouses',postController.getHouses);








router.get('/towns',(req, res) => {
  res.sendFile(path.join(__dirname, '/towns.html')); });

router.get('/getTowns',postController.getTowns);

router.get('/postTown',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addTown.html')); });

router.post('/addTown',postController.postTown);




router.get('/movies',(req, res) => {
  res.sendFile(path.join(__dirname, '/movies.html')); });

router.get('/getMovies',postController.getMovies);

router.get('/postMovie',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addMovie.html')); });

router.post('/addMovie',postController.postMovie);




router.get('/characters',(req, res) => {
  res.sendFile(path.join(__dirname, '/characters.html')); });

router.get('/getCharacters',postController.getCharacters);

router.get('/postCharacter',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addCharacter.html')); });

router.post('/addCharacter',postController.postCharacter);





router.get('/races',(req, res) => {
  res.sendFile(path.join(__dirname, '/races.html')); });

router.get('/getRaces',postController.getRaces);





router.get('/regions',(req, res) => {
  res.sendFile(path.join(__dirname, '/regions.html')); });

router.get('/getRegions',postController.getRegions);

router.get('/postRegion',(req, res) => {
  res.sendFile(path.join(__dirname, '/html/addRegion.html')); });

router.post('/addRegion',postController.postRegion);



module.exports = router;
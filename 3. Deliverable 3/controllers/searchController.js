const dataBase = require("../dataBase");

function getNameArtifacts(req,res,searchTerm) {
  const query = `SELECT * FROM lotr.artifacts WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};

function getTitleBooks(searchTerm)   {
  const query = `SELECT * FROM lotr.books WHERE Title LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    console.log(results);

    return results;
  });
};


function getNameCharacters(req,res,searchTerm){
  const query = `SELECT * FROM lotr.notable_characters WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};


function getNameEvents(req,res,searchTerm){
  const query = `SELECT * FROM lotr.events WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};


function getNameGroups(req,res,searchTerm){
  const query = `SELECT * FROM lotr.groups WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};


function getNameHouses(req,res,searchTerm){
  const query = `SELECT * FROM lotr.houses WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};

function getTitleMovies(req,res,searchTerm){
  const query = `SELECT * FROM lotr.movies WHERE title LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};

function getNameRaces(req,res,searchTerm){
  const query = `SELECT * FROM lotr.races WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};

function getNameRegions(req,res,searchTerm){
  const query = `SELECT * FROM lotr.regions WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};


function getNameTowns(req,res,searchTerm){
  const query = `SELECT * FROM lotr.towns WHERE Name LIKE '%${searchTerm}%'`;
  dataBase.query(query, (err, results) => {
    if (err) {
      console.error('Σφάλμα κατά την αναζήτηση:', err);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    res.json(results);
  });
};



module.exports =
    {
      getNameArtifacts,
    getTitleBooks,
    getNameCharacters,
    getNameEvents,
    getNameGroups,
    getNameHouses,
    getTitleMovies,
    getNameRaces,
    getNameRegions,
    getNameTowns
    }

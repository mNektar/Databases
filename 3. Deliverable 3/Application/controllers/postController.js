const path = require("path");
const database = require("../dataBase");

function search(req,res,searchTerm) {

    database.query('SELECT * FROM lotr.books WHERE title LIKE %?%' , [searchTerm], function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      res.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
    }
    console.log(results);
    res.json(results);
	});

}

function getArtifacts(request,response){
    database.query('SELECT * FROM lotr.artifacts', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postArtifact(request, response) {
  const { Name, Age_Created, Age_Destroyed, Creator } = request.body;

  const query = 'INSERT INTO lotr.artifacts (Name, Age_Created, Age_Destroyed, Creator) VALUES (?, ?, ?, ?)';

  database.query(query, [Name, Age_Created, Age_Destroyed, Creator], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}



function getBooks(request,response){
    database.query('SELECT * FROM lotr.books', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postBook(request, response) {
  const { Title, Editor, Illustrator, Date_Published, Publisher, Pages, Genre } = request.body;

  const query = 'INSERT INTO lotr.books (Title, Editor, Illustrator, Date_Published, Publisher, Pages, Genre) VALUES (?, ?, ?, ?, ?, ?, ?)';

  database.query(query, [Title, Editor, Illustrator, Date_Published, Publisher, Pages, Genre], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}



function getEvents(request,response){
    database.query('SELECT * FROM lotr.events', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});


}
function postEvent(request, response) {
  const { Name, Age_Started, Age_Finished, Location, Event_in_Book, Event_in_Movie } = request.body;

  const query = 'INSERT INTO lotr.events (Name, Age_Started, Age_Finished, Location, Event_in_Book, Event_in_Movie) VALUES (?, ?, ?, ?, ?, ?)';

  database.query(query, [Name, Age_Started, Age_Finished, Location, Event_in_Book, Event_in_Movie], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}




function getGroups(request,response){
    database.query('SELECT * FROM lotr.groups', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postGroup(request, response) {
  const { Name, Age_of_Creation, Age_of_Dissolution } = request.body;

  const query = 'INSERT INTO lotr.groups (Name, Age_of_Creation, Age_of_Dissolution) VALUES (?, ?, ?)';

  database.query(query, [Name, Age_of_Creation, Age_of_Dissolution], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}



function getHouses(request,response){
    database.query('SELECT * FROM lotr.houses', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}





function getTowns(request,response){
    database.query('SELECT * FROM lotr.major_towns_locations', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postTown(request, response) {
  const { Name, Region } = request.body;

  const query = 'INSERT INTO lotr.major_towns_locations (Name, Region) VALUES (?, ?)';

  database.query(query, [Name, Region], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}




function getMovies(request,response){
    database.query('SELECT * FROM lotr.movies', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postMovie(request, response) {
  const { Name, Director, Screenwriter, Date_Released, Runtime, Book_Adapting } = request.body;

  const query = 'INSERT INTO lotr.movies (Title, Director, Screenwriter, Date_Released, Runtime, Book_Adapting) VALUES (?, ?, ?, ?, ?, ?)';

  database.query(query, [Name, Director, Screenwriter, Date_Released, Runtime, Book_Adapting], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}





function getCharacters(request,response){
    database.query('SELECT * FROM lotr.notable_characters', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}
function postCharacter(request, response) {
  const { Name, Mother, Father, Race, House, Age_of_Birth, Age_of_Death } = request.body;

  const query = 'INSERT INTO lotr.notable_characters (Name, Mother, Father, Race, House, Age_of_Birth, Age_of_Death) VALUES (?, ?, ?, ?, ?, ?, ?)';

  database.query(query, [Name, Mother, Father, Race, House, Age_of_Birth, Age_of_Death], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}




function getRaces(request,response){
    database.query('SELECT * FROM lotr.races', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}


function getRegions(request,response){
    database.query('SELECT * FROM lotr.regions', function(error, results, fields) {
    if (error) {
      console.error('Σφάλμα επιλογής δεδομένων από τη βάση δεδομένων:', error);
      response.status(500).send('Σφάλμα ανάκτησης δεδομένων από τη βάση δεδομένων');
      return;
    }
    console.log(results);
    response.json(results);
	});
}

function postRegion(request, response) {
  const { Name, Continent } = request.body;

  const query = 'INSERT INTO lotr.regions (Name, Continent) VALUES (?, ?)';

  database.query(query, [Name, Continent], function (error, results, fields) {
      if (error) {
          // console.error('Σφάλμα εισαγωγής δεδομένων στη βάση δεδομένων:', error);
          const data = [{
            no: '1'
          }]
          console.log(error);
          response.json(data);
          return;
          // response.redirect('/artifacts');
      }

       const data = [{
            no: '2'
       }]
      // console.log('Artifact added successfully:', results);
      response.json(data);
  });
}

module.exports = {
    search,
	getArtifacts,
    getBooks,
	getEvents,
	getGroups,
    getHouses,
    getTowns,
    getMovies,
    getCharacters,
    getRaces,
    getRegions,
    postArtifact,
    postBook,
    postCharacter,
    postEvent,
    postGroup,
    postMovie,
    postRegion,
    postTown
};
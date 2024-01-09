const database = require("../dataBase");
const path = require("path");

let loggedIn;
let userName;
let registered;

function welcome(request,response){
	response.sendFile(path.join(__dirname + '/login1.html'));
}
function login(request,response){
    	// Capture the input fields
	userName = request.body.username;
	let password = request.body.password;
	console.log(userName);
	// Ensure the input fields exists and are not empty
	if (userName && password) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		database.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [userName, password], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) throw error;
			// If the account exists
			if (results.length > 0) {
				// Authenticate the user
                loggedIn = true;
				// Redirect to home page
				response.redirect('/homePage');
			} else {
				response.send('Incorrect Username and/or Password!');
			}
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
}

function homePage(request,response){
	response.sendFile(path.join(__dirname + '/mainPage.html'));
}

function signUp(req,res){
	    	// Capture the input fields
	let name = req.body.username;
	let password = req.body.password;
	let password_confirm = req.body.confirm_password;
	let email = req.body.email;
	console.log(name);
	console.log(password);
	console.log(password_confirm);
	console.log(email);
	// Ensure the input fields exists and are not empty
	if (name && (password===password_confirm)) {
		// Execute SQL query that'll select the account from the database based on the specified username and password
		database.query('INSERT INTO lotr.accounts (username,password,email) VALUES (?,?,?)', [name, password,email], function(error, results, fields) {
			// If there is an issue with the query, output the error
			if (error) {
				res.send('Incorrect Username and/or Password!');
			}
			// If the account exists
			else {
				console.log(results);
				// Authenticate the user
                registered = true;
				// Redirect to home page
				res.redirect('http://localhost:3000');
			}
			res.end();
		});
	}
	else {
		res.send('Please enter confirm the same Password!');
		res.end();
	}
}


module.exports = {
	login,
    signUp,
	welcome,
	homePage
};
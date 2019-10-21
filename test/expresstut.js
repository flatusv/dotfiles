var express = require('express');
var app = express();
app.disable('x-powerd-by');



//////////////////////////////////////////////////
var handlebars = require('express-handlebars').create({defaulLayout:'main'});
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');

// MORE IMPORTS
// body-parser parses your request and converts it into a format from which you can easily
// extract relevant information that you may need.
app.use(require('body-parser').urlencoded({extended: true}));

// for parsing form data, especially file uploads
var formidable = require('formidable');

// secure cookies and help with sessions
var credentials = require('./credentials.js');
app.use(require('cookie-parser')(credentials.cookieSecret));

// session
var session = require('express-session');
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));
//////////////////////////////////////////////////

// connect to database
console.log('Connecting to database');
const Database = require("better-sqlite3");
const dbOptions = { verbose: console.log };
const dbFile = "./db/example.db"; // creates file if doesn't exist
const db = new Database(dbFile, dbOptions);
app.locals.db = db; 

// populate db with dummy users
// db.prepare('CREATE TABLE IF NOT EXISTS users'
// + '(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)').run();
// const insert = db.prepare('INSERT INTO users (username, password) VALUES ("admin", "admin")').run();

// const insert = db.prepare('INSERT INTO friends (name, age) VALUES (@name, @age)');

// const insertMany = db.transaction((friends) => {
// for (const friend of friends) insert.run(friend);
// });

// insertMany([
// { name: 'Donald', age: 23 },
// { name: 'Micky', age: 24 },
// { name: 'Goofy', age: 25 },
// ]);

const stmtGetUser = db.prepare('SELECT * FROM users WHERE username = ? AND password = ?');
// const getUserFromDB = db.transaction((user) => {
// stmtGetUser.get(user).username;
// });


// set port '3000'
app.set('port', process.env.PORT || 8000);

// make files in folder "public" accessible to express
// __dirname is equal to the server filepath ($HOME/...)
app.use(express.static(__dirname + '/public'));

//////////////////////////////////////////////////
// Define routes
app.get('/', function(req, res){
    if (req.session.loggedin) {
		res.send('Welcome back, ' + req.session.username + '!');
	} else {
        res.render('home');
	}
});

// print which routes were taken to stdout
app.use(function(req, res, next){
    console.log("Looking for URL : " + req.url);
    next();
});

app.get('/contact', function(req, res){
    res.render('contact', { csrf: 'CSRF token here'});
});

app.get('/thankyou', function(req, res){
    res.render('thankyou');
});

app.post('/process', function(req,res){
    console.log('Form : ' + req.query.form);
    console.log('CSRF token : ' + req.body._csrf);
    console.log('Email : ' + req.body.email);     // as defined in contact.handlebar
    console.log('Question : ' + req.body.ques);   // as defined in contact.handlebar
    res.redirect(303, '/thankyou');
});

app.get('/login', function(req, res){
    res.render('login', { csrf: 'CSRF token here'});
});


app.post('/login', function(req,res){
    console.log('Form : ' + req.query.form);
    console.log('CSRF token : ' + req.body._csrf);
    console.log('Username : ' + req.body.loginUser);     // as defined in contact.handlebar
    console.log('Password : ' + req.body.loginPass);   // as defined in contact.handlebar

    var username = req.body.loginUser;
    var password = req.body.loginPass;

    if (username && password) {
        if (typeof stmtGetUser.get(username,password) !== "undefined") {
            req.session.loggedin = true;
            req.session.username = username;
            res.redirect('/');
        } else {
            res.send('Incorrect Username and/or Password!');
        }
    } else {
        res.send('Please enter Username and Password!');
        res.end();
    }
    // stmtGetUser.get(req.body.loginUser).password;
});

//////////////////////////////////////////////////
// Handle errors
//
// redirect 404 erros to 404.handlebar
app.use(function(req, res){
    res.type('text/html');
    res.status(404);
    res.render('404');
});

app.use(function(err, req, res, next){
    console.error(err.stack);
    res.status(500);
    res.render('500');
});

app.listen(app.get('port'), function(){
    console.log("Express started on localhost:" + app.get('port') + " press Ctr-C to terminate");
});

var express = require('express');
var app = express();

app.get('/', function (req, res) {
    res.send('Root Request through Express!');
});

app.get('/hello', (req, res) => {
    res.send('Hello Express!');
});

const hobbies = [
    'Swimming', 'Diving', 'Jogging', 'Cooking', 'Singing'
    ];

app.get('/hobbies', (req, res) => {
    res.send(hobbies);
});

app.listen(3000, "0.0.0.0", function () {
    console.log('Listening on port 3000!');
    console.log(' http://localhost:3000');
});

var express = require('express');
var app = express();

const domain = process.env.DOMAIN || '0.0.0.0'
app.listen(3000, "0.0.0.0", function () {
    console.log('Listening on port 3000!');
    console.log('http://localhost:3000');
});

app.get('/', function (req, res) {
    res.send('Root Response through Express!');
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

exports.getHobbies = () => {
    return hobbies;
}
exports.getHobby = id => {
    if (id < 1 || id > hobbies.length)
        return null;
    return hobbies[id - 1];
}

// 数据库相关
const host = process.env.DB_HOST || 'localhost'
const port = process.env.DB_PORT || '5432'

const {
    Pool
} = require("pg");
const pool = new Pool({
    user: 'root',
    host: host,
    database: 'postgres',
    password: 'root',
    port: parseInt(port),
})

app.get('/pg', async (req, res) => {
    const result = await pool.query('SELECT hobby FROM hobbies')
    res.send(result.rows);
})

app.get('/pg/:id', async (req, res) => {
    const id = req.params.id;
    const result = await pool.query('SELECT hobby FROM hobbies WHERE hobby_id=$1', [id])
    res.send(result.rows[0].hobby);
})

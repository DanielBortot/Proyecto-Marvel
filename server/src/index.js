const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const routes = require('./routes/rutas');
require('dotenv').config({path: __dirname + '/.env'});

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.set('PORT', process.env.PORT || 3000);

app.use((req, res, next)=> {
    res.header('Access-Control-Allow-Origin', '*'),
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});

app.use('/api', routes);

app.listen(app.get('PORT'), ()=> {
    console.log(`Servidor abierto en el puerto ${app.get('PORT')}`);
});
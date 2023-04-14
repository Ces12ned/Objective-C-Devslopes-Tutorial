var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.all('/*', function(req,res,next){

    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "POST", "GET");
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
    {
        id: 1,
        title: "Punks, Pan y Movimiento",
        description: "Relatividad y Transformaciones de Lorentz.",
        iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/AhLLNLSuIR8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
        thumbnail:"http://i3.ytimg.com/vi/AhLLNLSuIR8/hqdefault.jpg"
    },
    {
        id: 2,
        title: "La magia de la ciencia... (Humo con los dedos)",
        description: "Ciencia.",
        iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/JKQ8TpjgZhs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
        thumbnail:"http://i3.ytimg.com/vi/AhLLNLSuIR8/hqdefault.jpg"
    }
];


app.get('/tutorials', function(req,res){
    console.log("GET from server");
    res.send(tutorials);
});

app.listen(6069);
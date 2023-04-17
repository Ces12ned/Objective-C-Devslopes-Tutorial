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
        iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/AhLLNLSuIR8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></div>',
        thumbnail:"https://www.techgames.com.mx/wp-content/uploads/2023/02/Profesor-Pokemon-Friede-y-el-Capitan-Pikachu.jpg"
    },
    {
        id: 2,
        title: "La magia de la ciencia... (Humo con los dedos)",
        description: "Ciencia.",
        iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/JKQ8TpjgZhs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></div>',
        thumbnail:"https://static-cse.canva.com/blob/1035700/1600w-wK95f3XNRaM.jpg"
    }
];


app.get('/tutorials', function(req,res){
    console.log("GET from server");
    res.send(tutorials);
});

app.listen(6069);
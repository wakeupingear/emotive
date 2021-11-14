const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();

//set the port to listen on
app.use(cors({
    origin: '*'
}));
app.set('port', process.env.PORT || 9000);

app.get('*', (req, res) => {
    //send the file in ../frontend/build/
    let trim = req.path.replace('/game', '').trim();
    if (trim === "") trim += "/index.html";
    res.sendFile(path.resolve('../emotive-game/builds/' + trim));
});

app.listen(app.get('port'), () => {
    console.log('listening on port ' + app.get('port'));
});
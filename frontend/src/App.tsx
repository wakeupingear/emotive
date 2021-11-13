import React from 'react';
import Iframe from 'react-iframe';
import './App.css';

function App() {
  let gameURL = window.location.href + "game";
  return (
    <div className="App App-header">
      <div id="content">
        <Iframe id="headerGame" url={gameURL} title="Game" />
        <h1>WHOA THERE!</h1>
      </div>
      <div id="video">
        <h1>Video</h1>
      </div>
    </div>
  );
}

export default App;

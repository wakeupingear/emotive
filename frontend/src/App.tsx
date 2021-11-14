import React, { useState } from 'react';
import Iframe from 'react-iframe';
import './App.css';

import { Jutsu } from 'react-jutsu';

function App() {
  let gameURL = "http://localhost:9000/game";
  const roomName = "emotiveDemo";

  const date = new Date();

  const [visible, setVisible] = useState(true);
  const toggleJitsi = () => {
    setVisible(!visible);
  }
  return (
    <div className="App App-header">
      <div id="header">
        <h1>Emotive</h1>
      </div>
      <div id="content">
        <Iframe id="headerGame" url={gameURL} title="Game" />
      </div>
      <h1>How it Works</h1>
      <div id="about">
        <div id="video">
          <div id="jitsiWindow" className={visible ? "" : "hidden"}>
            <Jutsu
              roomName={roomName}
              displayName={"Player"}
              onMeetingEnd={() => console.log('Meeting has ended')}
              loadingComponent={<p>loading ...</p>} />
          </div>
          <div id="toggleButton" onClick={toggleJitsi} className="text clickable">Toggle Video</div>
        </div>
        <div className="text">
          <p>EMOTIVE sends your webcam feed through Jitsi to a remote PC.</p>
          <p>The PC performs real-time emotion detection, powered by TensorFlow.</p>
          <p>The emotion data is sent to an external server, where it is proxied back to the game!</p>
        </div>
      </div>
      <div id="footer">
        Created by <a href="https://willfarhat.com" target="_blank">Will Farhat</a> and <a href="https://levipinkert.wixsite.com/portfolio" target="_blank">Levi Pinkert</a> - {date.getFullYear()}
      </div>
    </div>
  );
}

export default App;

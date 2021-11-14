import React, { useState } from 'react';
import Iframe from 'react-iframe';
import './App.css';

import { Jutsu } from 'react-jutsu';

function App() {
  let gameURL = "http://api.willfarhat.com:9000/game";
  const roomName = "emotiveDemo";

  const date = new Date();

  const [visible, setVisible] = useState(true);
  const toggleJitsi = () => {
    setVisible(!visible);
  }
  return (
    <div className="App App-header">
      <div id="header">
        <h2>╱ EMOTIVE ╲</h2>
        <div className="text">
          <p>Bringing emotion into media</p>
        </div>
      </div>
      <div id="content">
        <Iframe id="headerGame" url={gameURL} title="Game" />
      </div>
      <div id="emotions">
        <p >Neutral</p>
        <p>Angry</p>
        <p>Happy</p>
        <p>Disgusted</p>
        <p>Sad</p>
        <p>Surprised</p>
        <p>Afraid</p>
      </div>
      <br></br>
      <br></br>
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
        <div className="vertical">
          <div className="text">
            <p>EMOTIVE sends your webcam feed through Jitsi to a remote PC.</p>
            <p>The PC performs real-time emotion detection, powered by Meta's DeepFace deep learning model</p>
            <p>The emotion data is sent to an external server, where it is proxied back to the game!</p>
          </div>
          <br></br>
          <div className="text">
            <p>Built with <a href="https://www.tensorflow.org/" target="_blank">TensorFlow</a>, 
              <a href="https://reactjs.org/" target="_blank"> React</a>,
              <a href="https://nodejs.org/en/" target="_blank"> NodeJS</a>,
              <a href="https://www.yoyogames.com/en" target="_blank"> GameMaker</a>,
              and a Raspberry Pi
            </p>
          </div>
        </div>
      </div>
      <div id="footer">
        Created by <a href="https://willfarhat.com" target="_blank">Will Farhat</a> and <a href="https://levipinkert.wixsite.com/portfolio" target="_blank">Levi Pinkert</a> - {date.getFullYear()}
      </div>
    </div>
  );
}

export default App;

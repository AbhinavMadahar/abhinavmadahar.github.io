import React, { Component } from 'react';

import { connect, sendMsg, sendMSG } from './api';
import Header from './components/Header/Header';
import ChatHistory from './components/ChatHistory/ChatHistory';

import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      chatHistory: [],
    };
  }

  componentDidMount() {
    connect((msg) => {
      console.log('New message');
      this.setState(prevState => ({
        chatHistory: [...prevState.chatHistory, msg]
      }));
    });
  }

  send() {
    console.log('Hello');
    sendMsg('Hello');
  }

  render() {
    return (
      <div className="App">
        <Header />
        <ChatHistory chatHistory={this.state.chatHistory} />
        <button onClick={this.send}>Hit</button>
      </div>
    );
  }
}

export default App;

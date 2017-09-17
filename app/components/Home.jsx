import React from 'react';

const Separator = () => (<hr />);

export default () => (
  <div className="container">
    <div className="row">
      <div className="eight columns">
        <header>
          <h1>Abhinav Madahar</h1>
          <p>
            <strong>Position:</strong> Rutgers University, undergraduate<br />
            <strong>Contact:</strong> <a href="mailto:abhinav.madahar@rutgers.edu">abhinav.madahar@rutgers.edu</a><br />
            <strong>News:</strong> <a href="https://twitter.com/abhinavmadahar">Twitter</a><br />
            <strong>GitHub:</strong> <a href="https://github.com/AbhinavMadahar">here</a>
          </p>
        </header>
      </div>
      <div className="four columns">
        <img alt="" className="avatar" src="https://avatars2.githubusercontent.com/u/8312336?v=4&u=b0e5e3b48cdc39317b6f78a90a913be01ab8cd73&s=400" />
      </div>
    </div>

    <Separator />

    <div className="row">
      <h2>Publications</h2>
      <ul>
        <li>
          <p>
            <strong>Application of a Shallow Neural Network to Short-Term Stock Trading</strong><br />
            <span className="faint">Abhinav Madahar, Yuze Ma, Kunal Patel</span><br />
            Machine learning is increasingly prevalent in stock market trading. Though neural networks have seen success in computer vision and natural language processing, they have not been as useful in stock market trading. To demonstrate the applicability of a neural network in stock trading, we made a single-layer neural network that recommends buying or selling shares of a stock by comparing the highest high of 10 consecutive days with that of the next 10 days, a process repeated for the stock&apos;s year-long historical data. A chi-squared analysis found that the neural network can accurately and appropriately decide whether to buy or sell shares for a given stock, showing that a neural network can make simple decisions about the stock market.<br />
            <a href="https://arxiv.org/abs/1703.10458">arXiv 1703.10458</a>
          </p>
        </li>
      </ul>
    </div>
  </div>
);

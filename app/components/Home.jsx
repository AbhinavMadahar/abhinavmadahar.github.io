import React from 'react';

export default () => (
  <div className="container">
    <div className="row">
      <div className="eight columns">
        <header>
          <h1>Abhinav Madahar</h1>
          <p>
            <strong>Position:</strong> Rutgers University, undergraduate student<br />
            <strong>Contact:</strong> <a href="mailto:abhinav.madahar@rutgers.edu">abhinav.madahar@rutgers.edu</a><br />
            <strong>Updates:</strong> <a href="https://twitter.com/abhinavmadahar">my Twitter</a>
          </p>
        </header>
      </div>
      <div className="four columns">
        <img alt="" src="media/img/abhinav.jpg" />
      </div>
    </div>

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

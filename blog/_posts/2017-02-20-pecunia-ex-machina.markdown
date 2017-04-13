---
layout: post
title:  "Pecunia ex Machina"
date:   2017-02-22 00:00:00 -0500
categories: ai
---

A few days ago, I made my first neural network, Pecunia ex Machina. It takes the past few days of stock data to recommend either buying or selling shares. I'll make a paper that goes hard with the specifics; this blog post is intended for beginners who want to learn about neural networks with an example.

## What's a neural network?

A neural network is a simulation of the human brain. In a biological brain, small neurons, which can only perform simple calculations, are combined to form a powerful brain that can look at memes and stuff. In the 1980s, a lot of work was done with artificial neural networks, in which small computing units (neurons) are linked together to form a big computing unit (neural network AKA brain). This is a helpful diagram (credit to Michael Nielsen):

![diagram of artificial neural network](http://neuralnetworksanddeeplearning.com/images/tikz12.png)

My team had negligible experience with neural networks, so we had to keep it simple. Unlike my [last post](/ai/2017/02/03/linear-regression-ai-with-gradient-descent.html), I won't get into the mathematics. Instead, I'll refer you, dear reader, to Michael Nielsen's [Neural Networks and Deep Learning](neuralnetworksanddeeplearning.com/), which I used to learn the basics of neural nets.

Basically, using a neural network has 3 steps:
1. you make the neural network
2. you teach the neural network
3. you ask the neural network to look at some new data (make sure to say "please")

To make the neural network, a human has to decide how many layers the network will have and how many neurons each layer will have. In the diagram above, there are 3 layers: one input layer, one output layer, and one hidden layer. The input layer gives the network some information and the output layer lets the network spit out a decision. The hidden layer(s) are the layer(s) that are hidden to the outside world. In deep learning, a neural net has lots of layers, but that's complicated and beginners should start with shallow neural networks with a single hidden layer.

Next, the neural network has to be given some data from which to learn, or "train." It can take hours for even simple neural networks to learn, but Pecunia ex Machina is so incredibly simple that it only takes a few seconds for it to train itself. Neural networks learn using backpropagation, which is a bit complicated, so I'll let Dr Nielsen explain it in [the aforementioned book](neuralnetworksanddeeplearning.com/).

After the neural network has trained itself, it is given some inputs and then spits out an output. Specifically, it takes in a vector of fixed length and outputs another vector of fixed length.

## My neural network

Pecunia ex Machina is a simple neural network that takes the past few days of stock data and decides whether to buy or sell shares to make as much money as possible. At first, it took the past 5 days of opening values (the cost at 9AM), but that worked poorly. After playing around, we changed the net to accept the past 10 days of high values (the highest cost of the day), which increased its accuracy. It outputs 2 numbers, both between 0 and 1, the first being the recommendation to buy and the second the recommendation to sell.

Though I was the principal developer of the neural network, I had support from my teammates. After I told him that the neural network was basically useless, Yuze Ma had the insight to change the number of days inputed. You can contact him at [yuze.bob.ma@gmail.com](mailto:yuze.bob.ma@gmail.com). Kunal Patel also helped develop an alternative neural network that did not appear in the final version of the app.

The full source code of the neural network, as well as documentation for its usage, is available on [GitHub](https://github.com/AbhinavMadahar/pecuniaexmachina/tree/master/ai) under the Apache 2.0 License. It was submitted to hackNYU, and its submission can be viewed on [Devpost](https://devpost.com/software/pecuniaexmachina).
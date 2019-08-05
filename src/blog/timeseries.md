---
title: Time series modelling with deep learning
author: Abhinav Madahar
date: 5 August 2019
---

Picture this. You have a dataset consisting of the minute-by-minute value of Amazon stock extending back 10 years, and you want to predict how it will look for the next 60 minutes. You're an up-and-coming deep learning specialist, so you'll want to use the latest the field offers.

The most powerful tool for time series modelling is the RNN, which is a type of neural network that reads multiple inputs one at a time, modifying its internal memory with each input. They come in two major flavours: LSTMs and GRUs. LSTMs were invented in 1997, and they proved much more powerful than prior RNNs because they had two forms of memory, a long term and a short term, hence their name *long short-term memory*. GRUs were invented in 2014, and they combined long- and short-term memory into a single memory without sacrificing much power. Both are very powerful RNN architectures.

Convolutional neural networks are also very powerful for time series modelling, but they trade power for speed. Most people understand CNNs in the context of computer vision, where they were first applied, but they can also be applied to time series data. Basically, they can look at a chunk of the data, perhaps 10 consecutive minutes of data, and then make an output of the same shape. However, they cannot retain a memory of an entire sequence, making them less fit for very long, very structured data like machine translation of a novel. However, they often work well and train quickly, so consider adding them.

RNNs and CNNs have their advantages and disadvantages. I personally recommend adding a few RNN layers to the beginning of your model and then a few CNN layers, followed by a few fully-connected layers, which has found success in academia.
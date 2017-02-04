---
layout: post
title:  "Differential Calculus with Lambda Calculus"
date:   2017-01-24 13:56:09 -0500
categories: mathematics
---

About a month ago, I tried to generalize the chain rule to partial derivatives, starting on
what seemed like a simple example:

$$\frac{\partial}{\partial x}\left[g(h(x,y),y)\right]=g^{(1,0)}(h(x,y),y)\cdot h^{(1,0)}(x,y)$$

However, the partial derivative with respect to _y_ proved much harder for me, taking a few weeks. While trying to solve the partial derivative

$$\frac{\partial}{\partial y}\left[g(h(x,y),y)\right]$$

I tried to use lambda calculus to solve

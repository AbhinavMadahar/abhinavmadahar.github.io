---
layout: post
title:  "Irrational to an Irrational Power"
date:   2017-03-13 00:00:00 -0500
categories: mathematics
---

When I was young, I was taught that $$a^b \equiv a \times a \times a \times ... \times a$$ repeated $$b$$ times. This makes sense when $$b$$ is a natural number (i.e. $$b \in \mathbb{N}$$), and some clever algebra can show

$$a^0 = 1$$

$$a^{-b} = \frac{1}{a^b}$$

$$a^{\frac{1}{b}} = \sqrt[b]{a}$$

$$a^{\frac{c}{b}} = \sqrt[b]{a^c}$$

So now, $$b \in \mathbb{Q}$$ makes sense. However, $$b \not\in \mathbb{Q}$$ is still a bit strange. For example, how can someone make sense of $$b = \sqrt{2}$$?

I won't explain how to interpret $$b \not\in \mathbb{Q}$$. Instead, I'll show that raising an irrational number to an irrational power does not necessarily result in an irrational value i.e.

$$a, b \not \in \mathbb{Q} \nRightarrow a^b \not \in \mathbb{Q}$$

To see why, take the special case of $$a, b = \sqrt{2} \not \in \mathbb{Q}$$. We know that
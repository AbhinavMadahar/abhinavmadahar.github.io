---
layout: post
title:  "Linear Regression AI with Gradient Descent"
date:   2017-02-3 13:56:09 -0500
categories: ai
---

**Artificial intelligence** describes many fields of study, with my personal favourite being machine learning (ML), in which computers learn to do something without the explicit teaching of a human. One simple but powerful tool in ML is gradient descent, a simple algorithm that optimizes things.

To demonstrate the simple power of gradient descent, we will make an AI in Python that finds a linear regression for any given data set.

# What is a linear regression?

Let's say that you have a data set

$$ x = \{x_1, x_2, x_3, ..., x_n\} $$

$$ y = \{y_1, y_2, y_3, ..., y_n\} $$

And want to find a function $$f$$ that approximates $$y$$ if given $$x$$

$$ f(x) \approx y $$

And want $$f$$ to be a simple, linear function

$$ f(x) = ax + b $$

How would you find the values of $$a$$ and $$b$$ that make $$f$$ as accurate as possible?

Well, one way is to use gradient descent. First, though, we need to know how accurate a regression is.

# How accurate is a regression?

One of the simplest ways to determine the innacuracy of a function is to find the sum of the squares of the errors:

$$ C = \sum_{x} (f(x) - y)^{2} $$

We have to find the **square** of the difference because, if we just added the errors together, then underestimating a data point and overestimating another one would cancel out because a positive plus a negative is close to zero. Because we square them, all the errors are positive, so the errors cannot cancel out.

We will sum $$f(x) - y$$ for all $$x$$ where $$y$$ is the correct value and $$f(x)$$ is the approximation. Because we squared the output, order doesn't matter, so we could have written $$y- f(x)$$.

We call the sum of the errors $$C$$ for "cost" because we want to use gradient descent to minimize the cost. Why do we call it "cost"? Tradition.

Whatever

Anyway, now we can know how innacurate our function $$f$$ is by calculating $$C$$ using our existing $$a$$ and $$b$$

We're almost ready to learn gradient descent, but we first have to learn a bit of calculus.

## A bit of calculus
I expect that you already understand derivatives. If not, please quickly read the [Simple Wikipedia page](https://simple.wikipedia.org/wiki/Derivative_(mathematics)).

Imagine that you have a function $$f(x) = x^2$$ whose graph is

![f(x) = x^2 graph](/assets/x2.png)

and whose derivative at $$x=1$$ is

![f(x) = x^2 graph](/assets/2x-1.png)

and whose derivative at $$x=-1$$ is

![f(x) = x^2 graph](/assets/-2x-1.png)

Notice how the derivative points up in the direction that the function increases? If $$f(x)$$ increases as $$x$$ increases, then the derivative points up; if $$f(x)$$ decreases as $$x$$ increases, then the derivative points down. We can use the sign of the derivative to know if we should increase or decrease $$x$$ to decrease $$f(x)$$, which will be useful for gradient descent.

Also, notice how the magnitude of the derivative, $$\mid f' (x) \mid$$, increases as $$x$$ goes away from the minimum (the vertex, in this case)? Look at these graphs:

![f(x) = x^2 graph](/assets/2x-1.png)
![f(x) = x^2 graph](/assets/4x-4.png)

That means that, as we get closer to the minimum, the derivative gets smaller, which will also be useful for gradient descent.

## Gradient descent, finally!

Gradient descent only optimizes 1 thing at a time, so, to optimize $$a$$ and $$b$$, we would have to run gradient on both one-after-the-other. However, there is a statistics fact that can let us quickly calculate $$b$$.

If we're given $$x$$ and $$y$$ then we can find $$(\overline{x}, \overline{y})$$, the average $$x$$ and average $$y$$. That point **must** be on the regression, so we can use that to find b by rearranging $$f$$

$$f(x) = a(x - \overline{x}) + \overline{y}$$

We know everything in that equation except $$a$$, which we can determine using gradient descent.

Gradient descent changes a variable, in this case $$a$$, to minimize a cost $$C$$ by:

$$a \rightarrow a' = a - \eta\frac{dC}{da}$$

Let's go through that equation. $$a$$ is the original slope and $$a'$$ is the new one, which we calculate using $$a - \eta\frac{dC}{da}$$

$$\eta$$ is the learning rate. We'll get back to it in a minute.

$$\frac{dC}{da}$$ is the derivative of $$C$$ with respect to $$a$$. Remember how the derivative points up if $$C$$ increases as $$a$$ increases and points down if $$C$$ decreases as $$a$$ increases? Well, pointing up makes the derivative positive and pointing down makes the derivative negative.

We can rewrite the equation as $$a \rightarrow a' = a + (-\frac{dC}{da})$$ to see that $$\Delta a = -\frac{dC}{da}$$.

If $$C$$ decreases as $$a$$ increases, then we want to increase $$a$$; the derivative is negative, so adding the negative of the derivative increases $$a$$, which we want to do. If $$C$$ increases as $$a$$ decreases, then we want to decrease $$a$$; the derivative is positive, so adding the negative of the derivative decreases $$a$$, which we want to do. Thus, adding the negative of the derivative of the derivative will always $$C$$ unless the learning rate is too high. However, we always get closer, which we can prove:

$$\Delta C = \Delta a \frac{dC}{da}$$

$$\Delta C = -\eta \frac{dC}{da} \frac{dC}{da}$$

$$\Delta C = -\eta (\frac{dC}{da})^2$$

We always make $$\eta$$ positive, and the square of any number is positive, and there's a negative sign at the front, so the change in $$C$$ is always negative. Thus, gradient descent always decreases $$C$$.

Anyway, the learning rate, $$\eta$$, is how big of a jump in $$a$$ each iteration of gradient descent should make. A big $$\eta$$ would make gradient descent learn more quickly, but making it too big will make gradient descent overshoot on the iterations so that $$a$$ would jump back-and-forth from the left to the right of the minimum. Making it too slow will make $$a$$ change too slowly, so you want a learning rate at just the right rate in the middle.

Also, we can approximate $$\frac{dC}{da}$$. First, make $$C(a)$$, a function that takes a slope and determines the cost (inaccuracy) given that slope. Then, use $$\frac{dC}{da} \approx \frac{C(a+\epsilon) - C(a)}{\epsilon}$$ where $$\epsilon$$ is a very small number; our code uses $$10^{-5}$$.

Now, we're ready to write some code.

# The code, in Python

<script src="https://gist.github.com/AbhinavMadahar/529de23fdce9a3c164b18794d740621c.js"></script>

---
title: "L'Hôpital's Rule"
date: 2020-10-29T09:15:32-05:00
---

Often when working with limits, you will come across a situation in which
your limit, when solved by using simple substitution,
ends up being an *indeterminate form*. An example of this is when
attempting to compute the following:

$$ \lim\limits_{x \to 0} f(x) = \frac{\sin(x)}{x} $$

If you tried solving this limit in the normal fashion,
by simply plugging in 0 for every time $ x $ appears,
you would get a strange answer:

$$ f(x) = \frac{\sin(0)}{0} \implies \frac{0}{0} $$

As you can see, our answer is (decidedly) indeterminate.
What does this mean?
An answer like the above usually means that while your
function *may* have a limit at the desired point,
it is not defined, which is why we get null as our
limit value when trying to plug it in.

What can we do in such a situation?
Since we don't have a graph available to us,
we don't have the option to try and solve this visually,
like we normally would.
Fortunately, there is a rule which comes in quite
handy when dealing with indeterminate forms.
L'Hopital's rule, which has been used for centuries
to solve this paradox, states the following:

$$ \lim\limits_{x \to y} \frac{f(x)}{g(x)} = \lim\limits_{x \to y} \frac{f'(x)}{g'(x)} $$

Basically, when given a quotient comprised of two functions, $ f(x) $ and $ g(x) $, you can find
their combined limits by dividing their respective derivatives by each other.
Let's test this on our previously used example,
beginning by turning $ \sin(x) $ into it's derivative $ \cos(x) $:

$$ \lim\limits_{x \to 0} \frac{\sin(x)}{x} \implies \frac{\cos(x)}{1} $$

<p align="center">The derivative of $ x $ is always 1.</p>

$$ f(x) = \frac{\cos(x)}{1} = 1 $$

<p align="center">Since $ \cos $ is continuous, we are left with $ cos(0) $.</p>

As you can see, if we use L'Hopital's rule, we can find the limit at 0 of $ \frac{\sin(x)}{x} $,
even though the function is not defined at that point, without using a graph.
It is important, however, to only use this rule if you know *for sure* that the
expression you are trying to solve for the limit of is an indeterminate form,
since it only works in those specific cases.

**If you haven't realized, this post was just a test run for my mathjax config lmao,
hope you enjoyed anyway though.**

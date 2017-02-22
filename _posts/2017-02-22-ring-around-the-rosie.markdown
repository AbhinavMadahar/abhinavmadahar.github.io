---
layout: post
title:  "Ring around the Rosie"
date:   2017-02-22 00:00:00 -0500
categories: mathematics
---

I won't bother hiding it: I'm a high school student. I have to attend gym class, and, though I want to go to the weight room, I can't right now, so I decided to take Adventure Ed. You, dear reader, don't have to know what any of that means, though. All you need to know is this game.

Imagine that there are $$n \geq 3$$ traffic cones separated from each other, around which students will stand, looking down at the ground. When the teacher gives the signal, the students are to look up at another person next to the same cone; if 2 student look at each other, they go to 2 other cones, and cannot go to the same one. The goal is to move around as much as possible.

I wanted to know the best strategy to win the game, and this is what I found. I honestly don't know if this is even mathematics, but whatever.

First, assume that the students can make an alliance and remember who is on the alliance.

Next, note that 2 students at the same cone can ensure that they will both move by looking at each other. Thus, our winning plan will ensure that 2 students in the alliance will always be at the same cone. Also, an odd number of students cannot ensure that they will all get to move because the students have to be put into pairs, and 3 objects cannot be put into pairs. Any even number of students $$2n$$ at a cone can be simplified to $$n$$ pairs, so we just have to ensure that an even number of students in the alliance will be at each cone. To make the plan simple and require the fewest people, we will assume that each cone is to have 2 students.

Give each cone a label $$k \in \mathbb{N}$$ where $$k+n$$ refers to the same cone (i.e. the cones are in a circle). Assume that every cone already has 2 students in it who have both looked at each other. Now, move one student at each cone $$k$$ to cone $$k+1$$ and the other to cone $$k-1$$. Now, each cone lost 2 students and got 1 from the next cone and 1 from the previous cone, so it has 2 students again, the optimal amount. Repeat.

Because each cone has 2 students, a game with $$n$$ cones requires, at most, $$2n$$ students to be solved optimally. However, we can solve any game with only 6 students. Let's prove that.

If we have a game with $$n$$ cones, we can take a subset with cardinality $$3$$ of the cones. Note that the students can still move from cone $$k$$ to $$k+1$$, but now, instead of going from $$k=3$$ to $$k=4 \neq 1$$, they go from $$k=3$$ to $$k=4=1$$. In essense, we have ignored all but 3 of the cones, simplifying the game to one for which $$n=3$$. Now, we only need $$2 \times n = 2 \times 3 = 6$$ students.

Again, not sure if this is even considered mathematics, but it certainly was fun to solve!
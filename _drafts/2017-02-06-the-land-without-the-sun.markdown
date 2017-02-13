---
layout: post
title:  "The Land without the Sun"
date:   2017-02-6 00:00:00 -0500
categories: mathematics
---

I live in New Jersey, where, in the dead of winter, the Sun doesn't get very high in the sky. Of course, I live below the Arctic circle, so the Sun comes out every day, but I wondered to myself, _if the world wasn't tilted and was a perfect circle, and the Sun was a point, how far North (or South) would you have to go for the Sun to disappear entirely?_

<!--A circle is shown with a radius that extends to a point on its circumference, which is on a line segment to another point-->
<!--The diagram is made in JS to be responsive-->
<svg width="100%" height="50vw" id="diagram-1">
	<circle id="earth" />
	<line id="radius"/> <!--Radius from Earth's centre-->
	<circle id="sun" />
	<line id="earth-sun-circumference-line"/>
	<line id="earth-sun-center-line"/>
</svg>

<script>
	const container = {
		width: document.getElementById("diagram-1").clientWidth,
		height: document.getElementById("diagram-1").clientHeight
	}

	const radiusLength = container.width / 5;
	const au = container.width / 5; // astronomical unit := distance from Earth to Sun
	const earthCenter = {
		x: container.width / 2 + radiusLength + au / 2,
		y: container.height / 2
	};
	
	sunPoint = {
		x: container.width / 2 - radiusLength - au / 2,
		y: earthCenter.y
	};

	const endpoints = [];
	endpoints[0] = earthCenter;
	
	const angle = Math.PI - Math.acos(radiusLength / Math.abs(earthCenter.x - sunPoint.x));

	endpoints[1] = {
		x: endpoints[0].x + radiusLength * Math.cos(angle),
		y: endpoints[0].y - radiusLength * Math.sin(angle) // we have to subtract because, in SVG, up is negative
	};
	
	const earth = document.getElementById("earth");
	const radiusLine = document.getElementById("radius");
	const sun = document.getElementById("sun");
	const earthCircumferenceSunLine = document.getElementById("earth-sun-circumference-line");
	const earthCenterSunLine = document.getElementById("earth-sun-center-line");

	earth.setAttribute("cx", earthCenter.x);
	earth.setAttribute("cy", earthCenter.y);
	earth.setAttribute("r", `${radiusLength}px`);
	earth.setAttribute("fill", "none");
	earth.setAttribute("stroke", "black");

	radiusLine.setAttribute("x1", endpoints[0].x);
	radiusLine.setAttribute("y1", endpoints[0].y);
	radiusLine.setAttribute("x2", endpoints[1].x);
	radiusLine.setAttribute("y2", endpoints[1].y);
	radiusLine.setAttribute("stroke-width", 2);
	radiusLine.setAttribute("stroke", "black");

	sun.setAttribute("cx", sunPoint.x);
	sun.setAttribute("cy", sunPoint.y);
	sun.setAttribute("r", `5px`);
	sun.setAttribute("fill", "black");
	sun.setAttribute("stroke", "black");
	
	earthCircumferenceSunLine.setAttribute("x1", endpoints[1].x);
	earthCircumferenceSunLine.setAttribute("y1", endpoints[1].y);
	earthCircumferenceSunLine.setAttribute("x2", sunPoint.x);
	earthCircumferenceSunLine.setAttribute("y2", sunPoint.y);
	earthCircumferenceSunLine.setAttribute("stroke-width", 2);
	earthCircumferenceSunLine.setAttribute("stroke", "black");
	
	earthCenterSunLine.setAttribute("x1", earthCenter.x);
	earthCenterSunLine.setAttribute("y1", earthCenter.y);
	earthCenterSunLine.setAttribute("x2", sunPoint.x);
	earthCenterSunLine.setAttribute("y2", sunPoint.y);
	earthCenterSunLine.setAttribute("stroke-width", 2);
	earthCenterSunLine.setAttribute("stroke", "black");
	earthCenterSunLine.setAttribute("stroke-dasharray", "5, 5");
</script>

Wow, that graph took me a long time to make.

Anyway, there are obviously many ways to solve this problem, but here's the first solution I made.

Let the Sun be the point $$ S = (0, 0) $$ and the Earth be the point $$ E = (x_1, 0) $$. Then, let the latitude of the point on the surface be $$ \theta $$. For New Jersey, $$ \theta \approx 40 \,^{\circ} \approx 0.70 $$. For convenience, we will use radians for the remainder of the article. Also, let the earth have radius $$r$$.

We can find the point $$ P $$ on the surface using the latitude and radius

$$ P = (r \cos (\theta), r \sin (\theta)) $$
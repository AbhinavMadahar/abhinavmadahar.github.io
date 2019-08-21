---
title: Ernest Mario Pharmacy Building
status: true
---

<div id="professor">
Woah there!
Looks like a wild Professor is trying to fight you!
He has an exam for which you didn't study.
Quick! Use your sword to fend him off.
If you don't, he'll hurt you, and you'll lose 10 HP every time it flashes red.

<img src="https://legendsoflocalization.com/wp-content/uploads/2013/12/pokemon-rival-forget-name1-1280x720.png" />
<button id="sword">Fight!</button>
</div>

<div id="clue" style="display:none">
Phew!
That was a close call.
Now that you've made the Pharmacy Building safer for underperforming students like us, you can move on to the next location, the Psychology Building.
<p><a href="/treasure-hunt/locations/psych.html"><button>I'm in the Psych Building.</button></a></p>
</div>

<script>
  const attack = setInterval(() => {
	document.body.style.backgroundColor = "red";
	let whiteness = 0;
	const decayBackToWhite = setInterval(() => {
	  document.body.style.backgroundColor = "rgb(255, " + whiteness + ", " + whiteness + ")";
	  whiteness += 1;
	}, 1);
	setTimeout(() => clearInterval(decayBackToWhite), 1255);

	localStorage.hp -= 10;
	document.getElementById('hp').innerHTML = localStorage.hp;
  }, 3000);

  document.getElementById('sword').addEventListener('click', () => {
	document.getElementById('professor').style.display = "none";

	clearInterval(attack);
	document.getElementById('clue').style.display = '';
  });
</script>

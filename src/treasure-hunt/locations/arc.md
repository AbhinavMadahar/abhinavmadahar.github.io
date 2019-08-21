---
title: ARC
status: true
---

This is the first stage of the Biological Sciences Dungeon.
Before you continue, you must find a sword.
To find a sword, count the number of exhibits on the third floor of ARC and tell me.
Note that, if you get a question wrong, you lose 10 HP.

<input id="exhibits" type="numeric" />
<button id="check-exhibit">Answer</button>

<div id="clue" style="display: none">
Now, you may continue to the next stage in the dungeon, the Ernest Mario Building.
Stay careful, though, because monsters lurk in every corner!

<p><a href="/treasure-hunt/locations/mario.html"><button>I'm here</button></a></p>

</div>

<script>
  document.getElementById("check-exhibit").addEventListener('click', () => {
	if(Number(document.getElementById('exhibits').value) == 10) {
	  alert('Correct! You now have a sword.');
	  localStorage.sword = true;
	  document.getElementById('items').innerHTML += '<li>Sword</li>';

	  document.getElementById('clue').style = '';

	} else {
	  alert('Incorrect! You lose 10 HP.');
	  localStorage.hp -= 10;
	  document.getElementById('hp').innerHTML = localStorage.hp;
	  if (localStorage.hp <= 0) {
		alert('Oof. You just lost the game. Imma go ahead and reset you back to the beginning of the dungeon.');
		window.location = '/treasure-hunt/locations/bio-dungeon.html';
	  }
	}
  });
</script>

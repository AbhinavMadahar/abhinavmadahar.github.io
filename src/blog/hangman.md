# Hangman

We're going to make an AI that solves hangman games.
To do so, we first need to get a list of the most widely-used words in the English language.


```python
with open('/usr/share/dict/words') as words_file:
    words = words_file.read().split('\n')
```

Many of these words are not very common, so we use Great Expectations to determine roughly how often words appear in the English language.
First, let's get all the words in the book.


```python
import requests
from nltk import word_tokenize

request = requests.get('https://norvig.com/big.txt')
text = str(request.content.lower()).replace('\\n', ' ').replace('\\r', ' ')
expectations = word_tokenize(text)
```

Now, let's find the frequency of each word.


```python
import pandas as pd

frequencies = dict(pd.Series(expectations).value_counts())
```

Now, we can restrict to the words used at least twice in Great Expectations.


```python
english = [word for word in words if word in frequencies and frequencies[word] >= 2]
```

Now, let's start a hangman game by selecting a word.


```python
answer = 'the dog eats a bone'
```

We don't tell the computer the answer, so we have to replace every character in the answer with a regex wildcard.


```python
guess = ''.join(' ' if character == ' ' else '.' for character in answer)
```

Now, we go through each character in the English language, finding which letter has the most valid answers to get the best guess.


```python
import re

applicable_words = []
for word in english:
    for word_in_guess in guess.split(' '):
        regexp = re.compile('^%s$'%word_in_guess)
        if regexp.match(word):
            applicable_words.append(word)

letter = pd.Series(list(''.join((applicable_words)))).value_counts().keys()[0]

used_letters = [letter]
```

Now, we find the times when the letter appears.


```python
guess = ''.join(letter if answer[i] == letter else character for i, character in enumerate(guess))
guess
```




    '..e ... e... . ...e'



Now, we keep going.


```python
while '.' in guess:
    applicable_words = []
    for word in english:
        for word_in_guess in guess.split(' '):
            regexp = re.compile('^%s$'%word_in_guess)
            if regexp.match(word):
                applicable_words.append(word)

    letters = pd.Series(list(''.join((applicable_words)))).value_counts().keys()
    letter = [letter for letter in letters if letter not in used_letters][0]
    used_letters.append(letter)

    guess = ''.join(letter if answer[i] == letter else character for i, character in enumerate(guess))
    print(guess)
```

    ..e ... ea.. a ...e
    ..e ... ea.. a ...e
    ..e .o. ea.. a .o.e
    ..e .o. ea.. a .one
    t.e .o. eat. a .one
    t.e .o. eat. a bone
    t.e .o. eat. a bone
    t.e .og eat. a bone
    the .og eat. a bone
    the .og eat. a bone
    the .og eats a bone
    the dog eats a bone


Let's run it on another hangman.


```python
answer = 'A listening advancing, and a superstars has because the thrift own the and in the collection or a she, but the campus own, so the girls or the business has in a thing because the campus or the amp and the studying or the videos with a and with a you with a editor caught'.lower()

guess = ''.join(' ' if character == ' ' else '.' for character in answer)

used_letters = []
while '.' in guess:
    applicable_words = []
    for word in english:
        for word_in_guess in guess.split(' '):
            regexp = re.compile('^%s$'%word_in_guess)
            if regexp.match(word):
                applicable_words.append(word)

    letters = pd.Series(list(''.join((applicable_words)))).value_counts().keys()
    letter = [letter for letter in letters if letter not in used_letters][0]
    used_letters.append(letter)

    guess = ''.join(letter if answer[i] == letter else character for i, character in enumerate(guess))
    print(guess)
```

    . ....e.... .......... ... . ...e...... ... .e....e ..e ...... ... ..e ... .. ..e ....e..... .. . ..e. ... ..e ...... .... .. ..e ..... .. ..e .....e.. ... .. . ..... .e....e ..e ...... .. ..e ... ... ..e ........ .. ..e ...e.. .... . ... .... . ... .... . e..... ......
    . ..s.e.... .......... ... . s..e.s...s ..s .e...se ..e ...... ... ..e ... .. ..e ....e..... .. . s.e. ... ..e .....s .... s. ..e ....s .. ..e ..s..ess ..s .. . ..... .e...se ..e .....s .. ..e ... ... ..e s....... .. ..e ...e.s .... . ... .... . ... .... . e..... ......
    a ..s.e.... a..a...... a.. a s..e.s.a.s .as .e.a.se ..e ...... ... ..e a.. .. ..e ....e..... .. a s.e. ... ..e .a...s .... s. ..e ....s .. ..e ..s..ess .as .. a ..... .e.a.se ..e .a...s .. ..e a.. a.. ..e s....... .. ..e ...e.s .... a a.. .... a ... .... a e..... .a....
    a ..s.e.... a..a...... a.. a s..ers.ars .as .e.a.se ..e ..r... ... ..e a.. .. ..e ....e..... .r a s.e. ... ..e .a...s .... s. ..e ..r.s .r ..e ..s..ess .as .. a ..... .e.a.se ..e .a...s .r ..e a.. a.. ..e s....... .r ..e ...e.s .... a a.. .... a ... .... a e....r .a....
    a ..s.e.... a..a...... a.. a s..ers.ars .as .e.a.se ..e ..r... o.. ..e a.. .. ..e .o..e...o. or a s.e. ... ..e .a...s o... so ..e ..r.s or ..e ..s..ess .as .. a ..... .e.a.se ..e .a...s or ..e a.. a.. ..e s....... or ..e ...eos .... a a.. .... a .o. .... a e...or .a....
    a ..ste.... a..a...... a.. a s..erstars .as .e.a.se t.e t.r..t o.. t.e a.. .. t.e .o..e.t.o. or a s.e. ..t t.e .a...s o... so t.e ..r.s or t.e ..s..ess .as .. a t.... .e.a.se t.e .a...s or t.e a.. a.. t.e st...... or t.e ...eos ..t. a a.. ..t. a .o. ..t. a e..tor .a...t
    a .iste.i.. a..a..i... a.. a s..erstars .as .e.a.se t.e t.ri.t o.. t.e a.. i. t.e .o..e.tio. or a s.e. ..t t.e .a...s o... so t.e .ir.s or t.e ..si.ess .as i. a t.i.. .e.a.se t.e .a...s or t.e a.. a.. t.e st...i.. or t.e .i.eos .it. a a.. .it. a .o. .it. a e.itor .a...t
    a .istenin. a..an.in.. an. a s..erstars .as .e.a.se t.e t.ri.t o.n t.e an. in t.e .o..e.tion or a s.e. ..t t.e .a...s o.n. so t.e .ir.s or t.e ..siness .as in a t.in. .e.a.se t.e .a...s or t.e a.. an. t.e st...in. or t.e .i.eos .it. a an. .it. a .o. .it. a e.itor .a...t
    a listenin. a..an.in.. an. a s..erstars .as .e.a.se t.e t.ri.t o.n t.e an. in t.e .olle.tion or a s.e. ..t t.e .a...s o.n. so t.e .irls or t.e ..siness .as in a t.in. .e.a.se t.e .a...s or t.e a.. an. t.e st...in. or t.e .i.eos .it. a an. .it. a .o. .it. a e.itor .a...t
    a listenin. a..ancin.. an. a s..erstars .as .eca.se t.e t.ri.t o.n t.e an. in t.e collection or a s.e. ..t t.e ca...s o.n. so t.e .irls or t.e ..siness .as in a t.in. .eca.se t.e ca...s or t.e a.. an. t.e st...in. or t.e .i.eos .it. a an. .it. a .o. .it. a e.itor ca...t
    a listening a..ancing. an. a s..erstars .as .eca.se t.e t.ri.t o.n t.e an. in t.e collection or a s.e. ..t t.e ca...s o.n. so t.e girls or t.e ..siness .as in a t.ing .eca.se t.e ca...s or t.e a.. an. t.e st...ing or t.e .i.eos .it. a an. .it. a .o. .it. a e.itor ca.g.t
    a listening a..ancing. an. a s.perstars .as .eca.se t.e t.ri.t o.n t.e an. in t.e collection or a s.e. ..t t.e ca.p.s o.n. so t.e girls or t.e ..siness .as in a t.ing .eca.se t.e ca.p.s or t.e a.p an. t.e st...ing or t.e .i.eos .it. a an. .it. a .o. .it. a e.itor ca.g.t
    a listening a..ancing. an. a s.perstars has .eca.se the thri.t o.n the an. in the collection or a she. ..t the ca.p.s o.n. so the girls or the ..siness has in a thing .eca.se the ca.p.s or the a.p an. the st...ing or the .i.eos .ith a an. .ith a .o. .ith a e.itor ca.ght
    a listening a..ancing. an. a superstars has .ecause the thri.t o.n the an. in the collection or a she. .ut the ca.pus o.n. so the girls or the .usiness has in a thing .ecause the ca.pus or the a.p an. the stu..ing or the .i.eos .ith a an. .ith a .ou .ith a e.itor caught
    a listening ad.ancing. and a superstars has .ecause the thri.t o.n the and in the collection or a she. .ut the ca.pus o.n. so the girls or the .usiness has in a thing .ecause the ca.pus or the a.p and the stud.ing or the .ideos .ith a and .ith a .ou .ith a editor caught
    a listening ad.ancing. and a superstars has .ecause the thri.t own the and in the collection or a she. .ut the ca.pus own. so the girls or the .usiness has in a thing .ecause the ca.pus or the a.p and the stud.ing or the .ideos with a and with a .ou with a editor caught
    a listening ad.ancing. and a superstars has because the thri.t own the and in the collection or a she. but the ca.pus own. so the girls or the business has in a thing because the ca.pus or the a.p and the stud.ing or the .ideos with a and with a .ou with a editor caught
    a listening ad.ancing. and a superstars has because the thri.t own the and in the collection or a she. but the ca.pus own. so the girls or the business has in a thing because the ca.pus or the a.p and the studying or the .ideos with a and with a you with a editor caught



    ---------------------------------------------------------------------------

    IndexError                                Traceback (most recent call last)

    <ipython-input-10-048f0d78a66c> in <module>
         13 
         14     letters = pd.Series(list(''.join((applicable_words)))).value_counts().keys()
    ---> 15     letter = [letter for letter in letters if letter not in used_letters][0]
         16     used_letters.append(letter)
         17 


    IndexError: list index out of range


# XPATH Test
so I struggled a ton on this but I wanted to submit something
## Part 1

### Question 1:

A node is basically an element in a document that you select to use when searching for it in XPATH. So it's that stuff inside the tags that defines what that code is. For example, a node in even worse Hamlet would be '<author>' tag and if you wanted to search for the author tags in XPATH you'd type in //author and that author is your node. A sequence then refers to the order in which things are listed within a code block when you search for it in XPATH. So, for example, the XPATH codeblock '//sp[contains(@who, "Rosencrantz")]' is a sequencen because it is saying find instances where Rosencratz is speaking and @who. Basically, a sequence is when multiple things occur. And then atomic values are basically datatypes so like when you use a boolean argument such as 'not' that is an atomic value. For example, in '//sp[not(ab)]' the atomic value is the 'not' aspect because it is saying find the instances where '//sp' occurs *without* an 'ab' child tag attached too.

### Question 2

An axis represents the family tree so, for example, in XPATH, an axis would be like '//sp/speaker' and the axis is the 'speaker' because it is a child of the 'sp' tag. And then a predicate seperates out things within a tag. So, for example if you were to put '//sp[@who="Hamlet"]' the predicate is within the brackets so would be the Hamlet. It is taking every instance where '//sp' occurs with 'Hamlet'. 

### Question 3
So basically the ! finds each individual sequence whereas the => finds the total of a sequence you ask it to find.

## Part 2

### Question 1
In order to find the instances where the line tags don't have an 'n' then you would type in: 
'//l[not(@n)]'
in terms of XPATH, this is giving the times where 'l' occurs but *not* 'n'. 

### Question 2
In order to find the number of times the last thing occurs in numerical values you would type:
'count(//l[not(@n)])'
because it is saying *count* (which is a command that numbers these values) the times where this instance occurs, so 5

### Question 3
i don't know I tried a lot of different things and nothing was working
But the only thing I got remotely close to was: 
'distinct-values([string-join(//sp, "Ghost")])' but it still wasn't actually working

### Question 4
To do this I put in: '//sp[speaker='Ghost']'
which got me 14 results but I'm not sure if this was the full one

### Question 5
I tried using:
//l[contains(., 'Hamlet')] | //ab[contains(., 'Hamlet')] 
I, again was not sure though

### Question 6
I couldn't get this one to work either so my only guess would be
'distinct-values(//l[contains("Hamlet")])' but it wasn't working correctly 

### Question 7
I didn't know how to do this either since it built off the last one

### Question 8
I'm also not sure about this one

### Question 9
Since I don't know what the expression would even be, I would basically take whatever that expression is, I would use a 'string-join' command so something like:
'string-join(//speaker, ', ')' with the comma being in between the parantheses so it would create a list separated by parantheses 

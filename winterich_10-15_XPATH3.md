# Hamlet XPATH 3

### Question 1
In order to find the last stage tag of the document and only that you would simply type in the XPATH function:
(//stage)[last()]

### Question 2
In order to find the line you would type in:
(//role)[last()][@xml:id="ham-ghost."]
but in order to get the xml:id for this you would put;
(//role)[last()]/@xml:id

### Question 3
In order to find the sp elements with more than 8 line tags within it you would type in:
//div/div//sp[count(descendant::l) > 8] 

### Question 4
To find out how many l elements are actually within each of those sp tags you would just type in:
//div/div//sp[count(descendant::l) > 8]/count(descendant::l) 
because it is asking the xpath to count the number of those l tags within the sp tags that has more than 8 so you can use the descendant tag to take you there.

### Question 5
In order to do this you have to build off the last two XPATH formulas. So you'll have to type in the function from question 3 to get to where there are times tht sp has more than 8 l tags. Then you need to specify you want to know the speaker and then distinct value tag.
//div/div//sp[count(.//l) > 8]//speaker => distinct-values()
or another way to type it would be 
distinct-values(//sp[count(descendant::l) > 8]/speaker) 

## Bonus questions

### Question 1
To find the last l tag in the play you would do the same thing as you did with the stage tag so you would put in:
(//l)[last()]
But then to find the last l tag *or* the last stage tag you can just put a | in the middle because that kind of serves as an "or" function so it would be:
(//l)[last()] | (//stage)[last()]

### Question 2
Then I gave up because I had to do other homework lol.


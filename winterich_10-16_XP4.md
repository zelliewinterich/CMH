# Hamlet XPATH 4

### Question 1
In order to find a hyphenated list of the characters you would put in the function:
'distinct-values([string-join(//role, '-')])'
the best choice to do this is role because the castList tag is where role is and that is what lists the characters

### Question 2
In order to find the instances where the l tags are middle parts you would put in:
'count(//l[contains(., 'M')])'
because it is saying count the amount of times where l contains the M which is the middle part 

### Question 3
In order to find the times where Rosencrantz speaks either alone or with Guildenstern you can put:
'//sp[contains(@who, "Rosencrantz")]' 
because it is saying go to the speeches (sp) which contain Rosencrantz and the only other times he speaks that isn't just him is with Guildenstern so you can just do that

### Question 4
To find the string length of the longest speech you can put in:
'//sp ! string-length(.)=>max()'
because it is saying find the string lengths of the (sp) tags and then find the maximum of that which is ultimately: 5248

## Bonus Questions 

### Question 1 
To find the XPATH expression that would not only list the max string length, but also find it in the doc you would type:
'//sp[string-length(.) eq [(//sp ! string-length(.))]=>max()] '
because it is saying find the speech that is equal to the string length with the maximum amount 

### Question 2 
I couldn't figure this one out




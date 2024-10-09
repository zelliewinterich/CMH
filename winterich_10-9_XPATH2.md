# Shakespeare-Hamlet text XPATH markdown

## Question 1
1. You would type //div/div/sp[not(l)] and this would show you speech tags without l tags as their child. Also there is 451 of these as the description says.
1. To do this you would type //div/div/sp[not(child::l or child::ab)] and there are 7 times this occurs and instead they just have speaker tags and lg attributes as immediate children *i asked my uncle about this one in full honesty*

## Question 2
1. The first Xpath expression shows everytime Hamlet speaks but only his first line of speech in each Hamlet tag
1. The second Xpath expression does the exact same thing as the first but instead of starting with a sp tag, it says descendant which is like saying start with the child of sp which is speaker and then it takes you to the l tags and says only the first lines of it. So it does the same thing it just goes about it in a different way
1. This Xpath expression is more selective and, since it is divided by the () it is saying find when Hamlet *only* has one line of speech after the sp tag. And so that only occurs once. The difference from the others is that this one is saying *only* this specific type (as in Hamlet having only one l tag after sp tag)
1. This Xpath expression does the same as the last one wherein it only selects that one instance where Hamlet has one l tag after a sp tag but, like example 2, it goes about it in a different way. This time, instead of going from the sp tag, it goes from descendant which is basically saying take the child (or descendant) of the sp tag, and find the instance where only 1 l exists.
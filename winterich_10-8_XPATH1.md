# Shakespeare XPATH

### Question 1 (also I used regex to find some of these tags first)
1. The ID numbers are all different when something is tagged as xml : ID under div tags.
1. You put in /TEI/text/body/div to reach just the acts 
1. Then you put in //div/div to get to just the scenes
1. You can do //text/body/div[3]/div to get just the scenes in Act 3

### Question 2
1. To find this you put in //div/div/sp/l/stage to find the stage directions just inside l tags and there are 127
1. To find these you would do /TEI/text/body/div/div/sp/stage so that it only takes into account the sp tags
1. You would do /TEI/text/body/div/div/stage and in the description it says there are 40. First I regexed stage tags to find the ones not in line or sp tags and then i looked up at the bar and saw what the XPATH formula was.
1. A parent element would be the div tag, another div, and then their parents are the body and texts and TEI. I think.   

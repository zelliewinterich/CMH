# RegEx3

The first thing I did was command U the text into Oxygen 

step 1: I deleted the Gutenberg boilerplate. 

step 2: I started by finding reserved characters (for all of these i had . unchecked)
1. I noticed that there were a lot of [ ] tags so i started by highlighting those. They seemed to be stage directions or emotions. So I put <> tags around them saying <stage direction> or <feeling>
1. i repeated the same process for the reserved characters and replaced them with appropiate tags
1. then I selected everything before the FIRST ACT and saved that elsewhere 
step 3: i had to find the blank lines and spaces 
1. Then I had to get rid of the blank lines so I did \n + to find them all and deleted them and replaced them with \n1 so there would only be 1 blank line and 
1. I did the same for the space characters, I just put (space) + and replaced them

step 4: I had to find the italics (for these i made sure that . matches all was checked)
1. I started by finding the underscores with the puncuation marks by finding (_.) and tagging them
1. then I found the ones that would be a title with upper-case letters so I did ^[A-Z] with the _ to find them and put <title> tags around them
1. Then for the rest of the underscores by searching for _ I put <emph> tags around them

step 5: i had to isolate the stage directions (i unchecked the .)
1. srage directions were between [] tags so i found all of those and replaced them with <stage> tags
1. i also got rid of all of the scene, act drop, or tableau lines by finding them in command f like SCENE+ or ACT DROP and deleted them 
1. then I found the act lines like first act by plugging htat in and put in <act> tags 
1. then immediately following this i was able to put in <setting> tags because it occured right after the <act> tags

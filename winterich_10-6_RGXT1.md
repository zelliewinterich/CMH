# Dracula RegEx Test

## Steps:

### Step 1:
First I took the Dracula text from the syllabus and command U'ed it into a text document in Oxygen but it didn't work so I manually had to go into the Gutenberg text and copy and paste the first two chapters into Oxygen

### Step 2: 
Next I tagged the entire document with (<)dracula(>) start and end tags byt manually highlighting the entire doucment and command E and putting in those tags

### Step 3: 
I also tagged the title manually by putting (<)title(>) start and end tags around it

### Step 4: 
Then I decided to specify the chapter tags so I command F'ed and searched for CHAPTER(space)[IVXLC]+ and replaced it with (<)chapter(>) start and end tags. And had the . dot checked.

### step 5: 
I had to tag the dated places and noticed they were at the beginning of entries with underscores so I searched for (_)([1-9])(space) May since I saw that they all had numbers after them then May. Then I replaced them with (<)date-place(>) tags. I had the dot checked.

### step 6: 
I had to find the italics whcih i made sure that . matches all was checked and I started by finding the underscores with the puncuation marks by finding (_.) and tagging them as (<)italics(>) tags and I had the . dot checked

### step 7: 
then i had to put in paragraph tags so i did this by find the line breaks by putting in (space).+ and replacing it with (<)paragph(>) start and end tags and I had the . dot unchecked

### step 8: 
i then went back in to tag the subtitle chapter tags so i found (  _[A-Z]._ ) and replaced them with (<)subtitle(>) tags for which I had the dot checked


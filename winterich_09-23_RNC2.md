The Blithedale Romance
zellie winterich

1. First I had to input the text into XML so I comman "U" the link and then saved as XML and reopened it so it wouldn't be text any longer.
2. I had to get rid of the beginning and ending non-important information so I just auto-deleted them by finding them and highlighting and then deleting 
3. I had to open the regular expression and then typed in find \n{3,}+ to and replaced it with \n \n so that everything only had 2
4. After going in and finding all of the line breaks and spaces and replacing them, I had to find the blank lines so did \n and replaced them with </p><p>
5. then i had to do the chapter titles and did the I then had to highlight the roman numerals so I typed in ([IVXLC]+) and replaced it with the </p><p> tags to be around them
6. then i found all chapter tags and put in <title> tags around them too
7. then i had to focus on the quotations and, as the syllabus states, i had to turn on dot-all mode to make sure i was capturing each quotation accurately and putting in "+?" in order to find quotations
8. after finding each quote i put <quote> tags around each 
9. then all i had to do was cleanup the document so i manually put in <author> and <book> start and end tags 
10. finally i put wrapped <title> tags in the toc and i got rid of the paragraph tags in the table of contents and replaced it with <toc> start and end tags 
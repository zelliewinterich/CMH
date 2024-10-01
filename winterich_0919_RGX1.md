# Shakespeares Sonnets

1. I needed to get rid of the spaces so I had to put in (space) .+ to and it highlighted just the indented lines which I replaced with no space
2. Then I needed to get rid of the regular line breaks so I just put in \n + and replaced those
3. I wanted to make everything turned into a line so I put ".+" in the find bar and made it so that each line was highlighted as a line by doing the \0 replace command so that the words would remain.
4. I then had to highlight the roman numerals so I typed in <line>([IVXLC]+)</line> and replaced it with <sonnet>\n\1</sonnet> so that the line tags would go away and be replaced with sonnet tags.
5. To make sure I had the sonnet tags correct I had to put in <sonnet no="\1">\1</sonnet>
6. Lastly I manually put in the title and author at the top
7. I made sure I saved it as an XML document so that it was well formatted

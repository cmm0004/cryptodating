# Cryptodating.net


## Features to add

- [ ] 1/8inch standard bleed for easier printing.
- [x] Option to arrange on letter-sized pre-perforated business card paper.
    -- built in, you just insert the pdf in a template in Word or something.
- [ ] Option to add a zero to even out puzzle, ie: the puzzle looks best as a 3x3 block of symbols and this:

![15](public/imgs/pdfimgs/15.jpg) ![16](/public/imgs/pdfimgs/16.jpg)

doesn't look as good as:

![0](public/imgs/pdfimgs/0.jpg) ![15](public/imgs/pdfimgs/15.jpg) ![16](public/imgs/pdfimgs/16.jpg)

even though they both evaluate to 391, but I worry it would cause too much confusion.


## current bugs

- [x] single leading zero a problem
- [ ] multiple leading zeros a problem
- [x] need to update key image to account for leading zeros, and possibly the 'aesthetic zeros' mentioned above.
- [ ] deeply consider finding a better way to deal with these pdfs in my filesystem.
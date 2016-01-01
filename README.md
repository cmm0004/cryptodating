# Cryptodating.net

## Features to add

- [x] 1/8inch standard bleed for easier printing.
  * done, check box for bleed.
- [x] Option to arrange on letter-sized pre-perforated business card paper.
  * built in, you just insert the pdf in a template in Word or something.
- [ ] Option to add a zero to even out puzzle, ie: the puzzle looks best as a 3x3 block of symbols and this:

![15](public/imgs/pdfimgs/15.jpg) ![16](/public/imgs/pdfimgs/16.jpg)

doesn't look as good as:

![0](public/imgs/pdfimgs/0.jpg) ![15](public/imgs/pdfimgs/15.jpg) ![16](public/imgs/pdfimgs/16.jpg)

even though they both evaluate to 391, but I worry it would cause too much confusion.


## current bugs

- [x] single leading zero a problem
  * created leading zero character and updated key.
- [x] multiple leading zeros a problem
  * doesn't break, but possible to have 4-length final puzzle line now. Messes with the symmetry, but doesn't overlap the name.
- [x] need to update key image to account for leading zeros, and possibly the 'aesthetic zeros' mentioned above.
  * haven't implemented aesthetic zeros.
- [x] deeply consider finding a better way to deal with these pdfs in my filesystem.
  * no longer resetting the environment to remove the generated pdfs, just deleting before I make a new one. Probably a dangerous,
but there's nothing to steal or break, if the app gets deleted, just reset the app server, and I dont save anything,
so there's no user information.
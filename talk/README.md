

use `make` to prepare the slideshow, then

export PAGE=0
alias n='cat out/xx$(printf "%02d" $PAGE)&&let "((PAGE=PAGE+1))"'
alias p='cat out/xx$(printf "%02d" $PAGE)&&let "((PAGE=PAGE-1))"'

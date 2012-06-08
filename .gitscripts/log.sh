HASH="%C(yellow)%h%C(reset)"
RELATIVE_TIME="%C(green)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset)"
REFS="%C(red)%d%C(reset)"
SUBJECT="%C(bold white)%s%C(reset)"

FORMAT="$HASH - $RELATIVE_TIME by $AUTHOR $REF%n $SUBJECT"

git log --pretty=tformat:"$FORMAT" $* | less -FXRS
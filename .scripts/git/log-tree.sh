HASH="%C(yellow)%h%C(reset)"
RELATIVE_TIME="%C(green)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset)"
REFS="%C(red)%d%C(reset)"
SUBJECT="%s"

FORMAT="$HASH{_}$RELATIVE_TIME{_}$AUTHOR{_}$REFS"

git log --all --graph --pretty="tformat:$FORMAT" $* |
column -t -s '{_}' |
less -FXRS
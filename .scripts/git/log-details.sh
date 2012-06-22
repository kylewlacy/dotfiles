HASH="%C(yellow)%h%C(reset)"
TIME="%C(green)%cd%C(reset) (%C(green)%ar%C(reset))"
RELATIVE_TIME="%C(green)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset) (%C(blue)%ae%C(reset))"
REFS="%C(red)%d%C(reset)"
SUBJECT="%C(bold)%s%C(reset)"
BODY="%n%b"

FORMAT="%n$SUBJECT ($HASH)%n by $AUTHOR on $TIME%n$BODY"

git log --pretty="tformat:$FORMAT" --date=local $*  | less -FXR
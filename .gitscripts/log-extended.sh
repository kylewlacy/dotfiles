HASH="%C(yellow)%h%C(reset)"
RELATIVE_TIME="%C(green)%ar%C(reset)"
AUTHOR="%C(bold blue)%an%C(reset)"
REFS="%C(red)%d%C(reset)"
SUBJECT="%C(bold white)%s%C(reset)"
REPLACE="{_}"
NL="{NL}"
N="\
"
MORE="\(...\)$NL"

FORMAT="%C(reset){NL}$HASH - $RELATIVE_TIME by $AUTHOR $REF{NL} $SUBJECT %C(8)$REPLACE>%b<$REPLACE%C(reset)"

OUTPUT="$(git log --pretty=tformat:"$FORMAT" $*)"

echo "$OUTPUT" | sed "s/$REPLACE><$REPLACE//g" | awk '{ printf "%s", $0 }' | sed -e 's/{NL}/\'$'\n/g' | sed "s/$REPLACE>/(/" | sed "s/<$REPLACE/)/" | less -FXRS
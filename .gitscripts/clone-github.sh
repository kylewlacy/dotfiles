FIRST_LENGTH=$(echo $1 | awk '{print length}')
ARGS_LENGTH=$(echo $* | awk '{print length}')
ARGS=$(echo $* | cut -c $(expr $FIRST_LENGTH + 2)-$ARGS_LENGTH)

git clone git://github.com/$1.git $ARGS
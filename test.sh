if [ -f Makefile ]; then
    make
    ./diff
else
    echo "Makefile not found"
fi

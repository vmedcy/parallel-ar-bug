#! /bin/sh

set -e

ENTRIES=1000

CMD='cmd.exe /C "arm-none-eabi-ar qc $out $in && arm-none-eabi-ranlib $out"'
# Add your ARM archives here
INPUTS="input1.o input2.o"

cat <<END
rule ar
  command = $CMD
  description = Creating archive \$out

END

echo -n "build all: phony"

seq $ENTRIES | while read i
do
	echo -n " out-$i.a"
done

cat <<END


default all

END


seq $ENTRIES | while read i
do
	echo "build out-$i.a: ar $INPUTS"
	echo
done

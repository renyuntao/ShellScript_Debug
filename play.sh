#!/bin/bash
#Date: 2015-09-07
#Author: YtRen
#Usage: This shell script was wriiten only for *.cpp file.For example,suppose you have a file named test.cpp,
# then you can use this script as follows:
# $ ./play.sh test
if [ -e compile_error ]
then
	rm compile_error
fi
g++ -c ${1}.cxx 2> compile_error
if [ -s compile_error ]
then 
	echo "Compile failed!"
	vim compile_error
	vim ${1}.cxx
	exit 1
else
	echo "Compile successfully!"
	g++ -o ${1} ${1}.o 2> link_error
	if [ $? != 0 ]
	then
		echo "Link failed!"
		vim link_error
		vim ${1}.cxx
		exit 1
	fi
	echo "Next execute program:"
	./${1}
fi
rm ${1}.o ${1} compile_error link_error
exit 0

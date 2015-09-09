#!/bin/bash
#Date: 2015-09-07
#Author: YtRen <rytubuntulinux@gmail.com>
#Usage:This shell script suport *.cxx,*.cpp,*.c file only,
# Suppose you have C++ source file named test.cxx,
# then you can use this script as follows:
# $ ./play.sh test cxx
# Similarly,if you have a file named test.c,then you can use
# this script as follows:
# $ ./play.sh test c
if [ -e compile_error ]
then
	rm compile_error
fi
if [ $2 = "cxx" ]
then
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
elif [ $2 = "cpp" ]
then
	g++ -c ${1}.cpp 2> compile_error
	if [ -s compile_error ]
	then 
		echo "Compile failed!"
		vim compile_error
		vim ${1}.cpp
		exit 1
	else
		echo "Compile successfully!"
		g++ -o ${1} ${1}.o 2> link_error
		if [ $? != 0 ]
		then
			echo "Link failed!"
			vim link_error
			vim ${1}.cpp
			exit 1
		fi
		echo "Next execute program:"
		./${1}
	fi
elif [ $2 = "c" ]
then
	g++ -c ${1}.c 2> compile_error
	if [ -s compile_error ]
	then 
		echo "Compile failed!"
		vim compile_error
		vim ${1}.c
		exit 1
	else
		echo "Compile successfully!"
		g++ -o ${1} ${1}.o 2> link_error
		if [ $? != 0 ]
		then
			echo "Link failed!"
			vim link_error
			vim ${1}.c
			exit 1
		fi
		echo "Next execute program:"
		./${1}
	fi
fi
rm ${1}.o ${1} compile_error link_error
exit 0


title="Frequency"
ifile=temp1
ofile=temp1.eps

if [ $1 ];then
	title=$3
fi

if [ $2 ];then
	ifile=$1
fi

if [ $3 ];then
	ofile=$2
fi


echo '''
reset
set terminal postscript enhanced eps color blacktext solid "Helvetica" 24
set output "'$ofile'"

set grid

set mxtics 10
#set grid xtics 
#set grid mxtics 
set grid mxtics xtics ls 7, ls 0
set logscale y 10
#set logscale x 10
#set style rect fc lt -1 fs solid 0.15 noborder

set xlabel "CPU CYCLES"
set ylabel "Frequency"

plot "'$ifile'" using 2 title "'$title'" with lines
''' | gnuplot



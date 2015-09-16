
title=1
ifile=temp1
ofile=temp1.eps



if [ $3 ];then
	title=$3
fi

if [ $1 ];then
	ifile=$1
fi

if [ $2 ];then
	ofile=$2
fi

#setups=`echo comp dedup c+d`
setups=`echo N T`

tit=`echo $ifile | sed 's/_/-/g'`
tit=`echo $tit | sed 's/stats-list-/cpu-cycles-/'`

echo '''
reset
set terminal postscript enhanced eps color blacktext solid "Helvetica" 24
set output "'$ofile'"

set grid
set title "'$tit'"
set mxtics 3
#set grid xtics 
#set grid mxtics 
set grid mxtics xtics ls 0, ls 0
set logscale y 10
#set logscale x 2
#set style rect fc lt -1 fs solid 0.15 noborder

set xlabel "CPU CYCLES * 100"
set ylabel "CDF "
set key on right bottom
set key font "',8'"
set key spacing "'0.4'"

''' > temp1


echo plot '\' >> temp1
i=1
i=$title
for ii in `cat filesizez | head -n $title | tail -n 1`
do
	j=0
	for jj in $setups
	do
		echo "'$ifile$j$i'" using 1:2 title "'$ii,$jj'" with lines lw 5 lc $j, '\' >> temp1
		
	
	echo  $i $j
	let ++j	
	done
	let ++i
done

echo "'' with lines lw 0" >> temp1


gnuplot temp1



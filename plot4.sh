
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

setups=`echo tmem Com0Dup0 Com10Dup90 Com90Dup10  Com45Dup15`
#setups=`echo tmem dup0 dup15 dup90`

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

set xlabel "Time"
set ylabel "No. of Puts"
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
		
#		tail -n+3 "$ifile$j$i" > "$ifile$j$i"_1

#		mv "$ifile$j$i"_1 "$ifile$j$i"
		color=`echo $j + 1 | bc`	
		echo "'$ifile$j$i'" using 1 title "'$ii$jj'" with lines lw 5 lc $color, '\' >> temp1
		
	
	echo  $i $j
	let ++j	
	done
	let ++i
done

echo "'' u 1 pt 7 ps 0" >> temp1


gnuplot temp1



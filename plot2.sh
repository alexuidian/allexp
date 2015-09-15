

ifile="stats_perf"
ofile="temp.eps"
ylabel="Counts"

if [ $1 ];then
	ifile="$1"
fi
if [ $2 ];then
	ofile="$2"
fi

if [ $3 ];then
	ylabel="$3"
fi

logy="set logscale y"

t1="N"
t2="T"
t3="TC"
t4="TD"
t5="TDC"
t6="TZ"
t7="TDZ"

side="right"
side="left"
t1="Tmem"
t2="Com0Dup0"
t3="Com10Dup90"
t4="Com90Dup10"
t5="Com45Dup15"





echo '''
reset
set terminal postscript enhanced eps color blacktext solid "'Helvetica'" 24
set output "'$ofile'"
set ylabel "'$ylabel'"
#set title "'Throughput'"
#set yrange [0.001:1]
#set xrange[-1:19]
#set xtics("1" 0,"2" 1,"5.5" 2,"11" 3,"1" 5,"2" 6,"5.5" 7,"11" 8,"1" 10,"2" 11,"5.5" 12,"11" 13,"1" 15,"2" 16,"5.5" 17,"11" 18)
#set grid xtics ytics lw 2
'$logy' 
#set key at 8,0.7
#set key on '$side' top
#set key Left top
set boxwidth 0.9
set xtics font "',8'"
#set xlabel font "',6'"
#set ylabel font "',6'"
set style fill border -1
set style data histogram
set style histogram cluster gap 1
set xtic offset 0,0.3
set key font "',8'"
set key nobox spacing "'0.4'"
set key samplen 1
#set key outside
#set key width -12
item=5
xoffset1=-0.32
yoffset=0.05
#set key at 2,3.5,2

plot newhistogram "Filesize ->",\
"'$ifile'" using 2:xtic(1) ti "'$t1'" fs pattern 0  lc 18 lw 1.2 ,\
"''" u 0:2:2 w labels font "',6'"  right offset first xoffset1 ,graph yoffset rotate by 45 notitle \
,\
"''" using 3 ti "'$t2'" fs pattern 9  lc 18 lw 1.2 , \
"''" u 0:3:3 w labels font "',6'"  right offset first xoffset1+0.16 ,graph yoffset rotate by 45 notitle \
,\
"''" using 4 ti "'$t3'" fs  pattern 3 lc 18 lw 1.2, \
"''" u 0:4:4 w labels font "',6'"  right offset first xoffset1+0.32 ,graph yoffset rotate by 45 notitle \
,\
"''"  using 5 ti "'$t4'" fs pattern 7 lc 7 lw 1.2, \
"''" u 0:5:5 w labels font "',6'"  right offset first xoffset1+0.48 ,graph yoffset rotate by 45 notitle \
,\
"''" using 6 ti "'$t5'" fs pattern 2 lc 18 lw 1.2, \
"''" u 0:6:6 w labels font "',6'"  right offset first xoffset1+0.64 ,graph yoffset rotate by 45 notitle \
#,\
#"''"  using 7 ti "'$t6'" fs pattern 21  lc 7 lw 1.2, \
#"''" u 0:7:7 w labels font "',6'"  right offset first xoffset1+.80 ,graph yoffset rotate by 45 notitle \
#,\
#"''"  using 8 ti "'$t7'" fs pattern 27  lc 7 lw 1.2, \
#"''" u 0:8:8 w labels font "',6'"  right offset first xoffset1+.96 ,graph yoffset rotate by 45 notitle \

''' | gnuplot


reset
set terminal postscript enhanced eps color blacktext solid 'Helvetica' 24
set output "temp.eps"
set ylabel 'Throughput mBps'
set title 'Throughput'
#set yrange [0.001:1]
#set xrange[-1:19]
#set xtics("1" 0,"2" 1,"5.5" 2,"11" 3,"1" 5,"2" 6,"5.5" 7,"11" 8,"1" 10,"2" 11,"5.5" 12,"11" 13,"1" 15,"2" 16,"5.5" 17,"11" 18)
#set grid xtics ytics lw 2
set logscale y 10
set key at 6,0.6
set boxwidth 0.9
set xtics font ',18'
set xlabel font ',6'
set ylabel font ',6'
set style fill border -1
set style data histogram
set style histogram cluster gap 1
set xtic offset 0,0.3
set key font ',14'

plot newhistogram "Filesize ->",\
'stats_perf' using 1 ti 'N' fs pattern 1  lc 18 lw 1.2,\
'' using 2 ti 'T' fs pattern 9  lc 18 lw 1.2,\
'' using 3 ti 'TC' fs  pattern 3 lc 18 lw 1.2,\
''  using 4 ti 'TD' fs pattern 7 lc 7 lw 1.2,\
'' using 5 ti 'TZ' fs pattern 2 lc 18 lw 1.2,\
''  using 6 ti 'TDC' fs pattern 21  lc 7 lw 1.2,\
''  using 7 ti 'TDZ' fs pattern 27  lc 7 lw 1.2

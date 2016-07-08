#!/bin/gnuplot

set terminal postscript color
set output 'MSD_with_fit.ps'

set xlabel "Time (fs)"
set ylabel "MSD"

set print "slope of fits" append

set title "Diffusion of Li in a-Li at 600K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'a-Si-0600K/ein.out' u 1:3 via a,b
print a
plot 'a-Si-0600K/ein.out' u 1:3 w l title "600K", f(x) w l

set title "Diffusion of Li in a-Li at 800K with fit"
f(x) = b + a*x
fit [1000:6000] [:] f(x) 'a-Si-0800K/ein.out' u 1:3 via a,b
print a
plot 'a-Si-0800K/ein.out' u 1:3 w l title "800K", f(x) w l

set title "Diffusion of Li in a-Li at 1000K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'a-Si-1000K/ein.out' u 1:3 via a,b
print a
plot 'a-Si-1000K/ein.out' u 1:3 w l title "1000K", f(x) w l

set title "Diffusion of Li in a-Li at 1200K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'a-Si-1200K/ein.out' u 1:3 via a,b
print a
plot 'a-Si-1200K/ein.out' u 1:3 w l title "1200K", f(x) w l

set title "Diffusion of Li in c-Li at 600K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'c-Si-0600K/ein.out' u 1:3 via a,b
print a
plot 'c-Si-0600K/ein.out' u 1:3 w l title "600K", f(x) w l

set title "Diffusion of Li in c-Li at 800K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'c-Si-0800K/ein.out' u 1:3 via a,b
print a
plot 'c-Si-0800K/ein.out' u 1:3 w l title "800K", f(x) w l

set title "Diffusion of Li in c-Li at 1000K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'c-Si-1000K/ein.out' u 1:3 via a,b
print a
plot 'c-Si-1000K/ein.out' u 1:3 w l title "1000K", f(x) w l

set title "Diffusion of Li in c-Li at 1200K with fit"
f(x) = b + a*x
fit [1000:12000] [:] f(x) 'c-Si-1200K/ein.out' u 1:3 via a,b
print a
plot 'c-Si-1200K/ein.out' u 1:3 w l title "1200K", f(x) w l

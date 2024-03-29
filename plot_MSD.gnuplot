#!/bin/gnuplot

set terminal postscript color
set output 'Diffusion of Li and Si in c-Si.ps'
set xlabel "MSD"
set ylabel "Time (fs)"
set title "Diffusion of Li and Si in c-Si at 600K"
plot 'c-Si-0600K/ein.out' u 1:2 w l title "Si", 'c-Si-0600K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in c-Si at 800K"
plot 'c-Si-0800K/ein.out' u 1:2 w l title "Si", 'c-Si-0800K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in c-Si at 1000K"
plot 'c-Si-1000K/ein.out' u 1:2 w l title "Si", 'c-Si-1000K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in c-Si at 1200K"
plot 'c-Si-1200K/ein.out' u 1:2 w l title "Si", 'c-Si-1200K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in a-Si at 800K"
plot 'a-Si-0800K/ein.out' u 1:2 w l title "Si", 'a-Si-0800K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in a-Si at 1000K"
plot 'a-Si-1000K/ein.out' u 1:2 w l title "Si", 'a-Si-1000K/ein.out' u 1:3 w l title "Li"

set title "Diffusion of Li and Si in a-Si at 1200K"
plot 'a-Si-1200K/ein.out' u 1:2 w l title "Si", 'a-Si-1200K/ein.out' u 1:3 w l title "Li"

set output 'Comparing Diffusion of Li in a-Si and c-Si.ps'
set title "Comparing Diffusion of Li in a-Si and c-Si at 600K"
plot 'c-Si-0600K/ein.out' u 1:3 w l title "c-Si",'a-Si-0600K/ein.out' u 1:3 w l title "a-Si"

set title "Comparing Diffusion of Li in a-Si and c-Si at 800K"
plot 'c-Si-0800K/ein.out' u 1:3 w l title "c-Si",'a-Si-0800K/ein.out' u 1:3 w l title "a-Si"

set title "Comparing Diffusion of Li in a-Si and c-Si at 1000K"
plot 'c-Si-1000K/ein.out' u 1:3 w l title "c-Si",'a-Si-1000K/ein.out' u 1:3 w l title "a-Si"

set title "Comparing Diffusion of Li in a-Si and c-Si at 1200K"
plot 'c-Si-1200K/ein.out' u 1:3 w l title "c-Si",'a-Si-1200K/ein.out' u 1:3 w l title "a-Si"

//Q: Plot Maxwell-Boltzmann distribution function.

funcprot(0); //switchs off scilab function protection mode i.e. it allows you to redefine functions in your code
clc; //clears console
clf; //clears figure console
clear; //clears previous variable values
kB=1.380649e-23; //Boltzmann constant
mu=0; //chemical potential
Ei=0;Ef=12.42e-21; //endpoints of energy spectrum i.e. average kinetic energy of H-molecules in the atmosphere
N=1000; //number of energy levels
E=linspace(Ei,Ef,N); //creates a linear space of energy levels
T=300; //the absolute temperature i.e. earth temperature
function [MB]=Maxwell_Boltzmann(T) //defines the distro function
    for i=1:N
        MB(i)=exp(-(E(i)-mu)/(kB*T));
    end
endfunction
plot2d(E,Maxwell_Boltzmann(T),1); 
xgrid();
title("Maxwell-Boltzmann Distribution");
xlabel("Energy of the state");
ylabel("Average occupancy of the state");

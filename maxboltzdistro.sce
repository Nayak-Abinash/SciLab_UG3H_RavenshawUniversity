//Q: Plot Maxwell-Boltzmann distribution function.
//It describes the distribution of classical material particles over various energy states in thermal equilibrium.


funcprot(0); //switchs off scilab function protection mode i.e. it allows you to redefine functions in your code
clc; //clears console
clf; //clears figure console
clear; //clears previous variable values
kB=1.380649e-23; //the Boltzmann constant
mu=0; //the chemical potential
Ei=0;Ef=12.42e-21; //endpoints of the energy spectrum e.g. average kinetic energy of H-molecules in the atmosphere
N=1000; //number of energy levels
E=linspace(Ei,Ef,N); //creates a linear space of energy levels
T=300; //the absolute temperature e.g. earth temperature
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

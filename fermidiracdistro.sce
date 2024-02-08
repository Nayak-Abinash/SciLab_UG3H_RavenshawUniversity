//Q: Plot Fermi-Dirac distribution function.
//It describes the distribution over energy states of a system of non-interacting identical particles obeying Fermi-Dirac statistics.


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
function [FD]=Fermi_Dirac(T) //defines the distro function
    for i=1:N
        FD(i)=1/(exp((E(i)-mu)/(kB*T)) + 1);
    end
endfunction
plot2d(E,Fermi_Dirac(T),1); 
xgrid();
title("Fermi-Dirac Distribution");
xlabel("Energy of the state");
ylabel("Average occupancy of the state");

//Q: Plot Maxwell-Boltzmann distribution function.
//Compare the distribution for different chemical potentials and state your observations.
//It describes the distribution of classical material particles over various energy states in thermal equilibrium.


funcprot(0); //switchs off scilab function protection mode i.e. it allows you to redefine functions in your code
clc; //clears console
clf; //clears figure console
clear; //clears previous variable values
kB=1.380649e-23; //the Boltzmann constant
//mu=0; //the chemical potential
Ei=0;Ef=12.42e-21; //endpoints of the energy spectrum e.g. average kinetic energy of H-molecules in the atmosphere
N=1000; //number of energy levels
E=linspace(Ei,Ef,N); //creates a linear space of energy levels
T=300; //the absolute temperature e.g. earth temperature
function [MB]=Maxwell_Boltzmann(T,mu) //defines the distro function
    for i=1:N
        MB(i)=exp(-(E(i)-mu)/(kB*T));
    end
endfunction
plot2d(E,Maxwell_Boltzmann(T,0),2); 
plot2d(E,Maxwell_Boltzmann(T,5e-21),3); 
plot2d(E,Maxwell_Boltzmann(T,9e-21),5); 
xgrid();
title("Maxwell-Boltzmann Distribution");
xlabel("Energy of the state");
ylabel("Average occupancy of the state");
legend('mu=0','mu=5e-21','mu=9e-21');

//Observations: The average occupancy increases with increasing chemical potential.

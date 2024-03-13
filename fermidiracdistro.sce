//Q: Plot Fermi-Dirac distribution function.
//Compare the distribution for different chemical potentials and state your observations.
//It describes the distribution over energy states of a system of non-interacting identical particles obeying Fermi-Dirac statistics. e.g. neutrinos or in case of negligible interactions this could be applied to a system of fermions like electrons,muons rtc.


funcprot(0); //switchs off scilab function protection mode i.e. it allows you to redefine functions in your code
clc; //clears console
clf; //clears figure console
clear; //clears previous variable values
kB=1.380649e-23; //the Boltzmann constant
//mu=0; //the chemical potential
Ei=0;Ef=12.42e-21; //endpoints of the energy spectrum e.g. average kinetic energy of H-molecules in the atmosphere
N=50; //number of energy levels
E=linspace(Ei,Ef,N)'; //creates a linear space of energy levels
T=300; //the absolute temperature e.g. earth temperature
function [FD]=Fermi_Dirac(T,mu) //defines the distro function
    for i=1:N
        FD(i)=1/(exp((E(i)-mu)/(kB*T)) + 1);
    end
endfunction
mu1=0;mu2=5e-21;mu3=9e-21;
plot(E./1e-21,Fermi_Dirac(T,mu1),'r.-');
plot(E./1e-21,Fermi_Dirac(T,mu2),'--m*');
plot(E./1e-21,Fermi_Dirac(T,mu3),'b.->');
title("$\bf{Fermi-Dirac\; Distributions\; for\; varying\; \mu}$","fontsize",3,"edgecol",5); 
xlabel("$\bf{Energy\;of\;the\;State,E_{i}(10^{-21}J) \rightarrow}$","fontsize",2,"edgecol",5); 
ylabel("$\bf{Average\;Occupancy\;of\;the\;State\;,<N_i> \rightarrow}$","fontsize",2,"edgecol",5); 
xgrid();
L1=legend(["mu="+string(mu1),"mu="+string(mu2),"mu="+string(mu3)],1);
L1.font_size=2;
L1.font_style=2;
figaxes=gca(); //gets the current axes
figaxes.box="on"; //puts the diagram in a box
figaxes.data_bounds=[0 0;8 1]; //sets the axes limit

//Observations: The average occupancy increases with increasing chemical potential.


















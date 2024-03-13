//Q: Plot Bose-Einstein distribution function.
//It describes the distribution over energy states of a system of non-interacting identical particles obeying Bose-Einstein statistics.


funcprot(0); //switchs off scilab function protection mode i.e. it allows you to redefine functions in your code
clc; //clears console
clf; //clears figure console
clear; //clears previous variable values
kB=1.380649e-23; //the Boltzmann constant
//mu=0; //the chemical potential
Ei=3.1e-22;Ef=12.42e-21; //endpoints of the energy spectrum e.g. average kinetic energy of H-molecules in the atmosphere
N=500; //number of energy levels
E=linspace(Ei,Ef,N)'; //creates a linear space of energy levels
T=300; //the absolute temperature e.g. earth temperature
function [BE]=Bose_Einstein(T,mu) //defines the distro function
    for i=1:N
        BE(i)=1/(exp((E(i)-mu)/(kB*T)) - 1);
    end
endfunction
mu1=0;mu2=2.3e-22;mu3=2.9e-22;
plot(E./1e-21,Bose_Einstein(T,mu1),'r.-');
plot(E./1e-21,Bose_Einstein(T,mu2),'--m*');
plot(E./1e-21,Bose_Einstein(T,mu3),'b.->');
title("$\bf{Bose-Einstein\; Distributions\; for\; varying\; \mu}$","fontsize",3,"edgecol",5); 
xlabel("$\bf{Energy\;of\;the\;State,E_{i}(10^{-21}J) \rightarrow}$","fontsize",2,"edgecol",5); 
ylabel("$\bf{Average\;Occupancy\;of\;the\;State\;,<N_i> \rightarrow}$","fontsize",2,"edgecol",5); 
xgrid();
L1=legend(["mu="+string(mu1),"mu="+string(mu2),"mu="+string(mu3)],1);
L1.font_size=2;
L1.font_style=2;
figaxes=gca(); //gets the current axes
figaxes.box="on"; //puts the diagram in a box
figaxes.data_bounds=[0 0;8 20]; //sets the axes limit

//For Bose-Einstein distribution the chemical potential should always be less than the energy. As the chemical potential approaches the energy of the state the average occupancy increases.






















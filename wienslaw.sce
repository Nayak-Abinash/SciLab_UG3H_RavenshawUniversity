//Plot Wien's Law of black body radiation at different temperatues.

funcprot(0); //lets us redefine functions
clear;
clc; //clears the console
clf; //clears figure console
h=6.62607015e-34; //planck's constant
c=2.998e8; //speed of light in m/s
kB=1.380649e-23; //Boltzmann's constant
N=60; //number of points on the plot
lambda=linspace(0,3e-6,N); //an array of N wavelength points on the x-axis
function [fun]=Wiens(T) //Wien's spectral radiance function
    for i=1:N
        fun(i)=((2*h*(c^2))/lambda(i)^5)*(1/exp((h*c)/(lambda(i)*kB*T))) 
    end
endfunction
T1=3000; 
T2=4000; 
T3=5000;
//T1=input("Enter T1: "); //taking temperatures as inputs
//T2=input("Enter T2: ");
//T3=input("Enter T3: ");
plot(lambda./1e-6,Wiens(T1)./1e12,'r.-');
plot(lambda./1e-6,Wiens(T2)./1e12,'--m*');
plot(lambda./1e-6,Wiens(T3)./1e12,'b-.>'); 
title("$\bf{Wien''s\;Curves\;for\;Varying\;Temperatures}$","fontsize",3,"edgecol",5); 
xlabel("$\bf{Wavelength,\lambda(\mu m) \rightarrow}$","fontsize",2,"edgecol",5); 
ylabel("$\bf{Spectral\;Radiance,B_\mu(TW.sr^{-1}.m^{-3}) \rightarrow}$","fontsize",2,"edgecol",5); 
xgrid();
L1=legend(["T="+string(T1)+"K","T="+string(T2)+"K","T="+string(T3)+"K"],1);
L1.font_size=2;
L1.font_style=2;
figaxes=gca(); //gets the current axes
figaxes.box="on"; //puts the diagram in a box
figaxes.data_bounds=[0 0;3 14]; //sets the axes limit


























//Plot Raleigh-Jeans Law at different temperatues.

funcprot(0); //lets us redefine functions
clc; //clears the console
clf; //clears figure console
c=299792458; //speed of light in m/s
kB=1.380649e-23; //Boltzmann's constant
N=500; //number of points on the plot
lambda=linspace(0,3e-4,N)'; //an array of N wavelength points on the x-axis
function [fun]=Raleigh_Jean(T) //defining the Raleigh-Jeans
    for i=1:N
        fun(i)=(2*c*kB*T)/lambda(i)^4 //spectral radiance formula
    end
endfunction
T1=3000; 
T2=4000; 
T3=5000;
//T1=input("Enter T1: "); //taking temperatures as inputs
//T2=input("Enter T2: ");
//T3=input("Enter T3: ");
plot(lambda./1e-5,Raleigh_Jean(T1)./1e10,'r.-');
plot(lambda./1e-5,Raleigh_Jean(T2)./1e10,'--m*');
plot(lambda./1e-5,Raleigh_Jean(T3)./1e10,'b-.>'); 
title("$\bf{Raleigh-Jean''s\;Curves\;for\;Varying\;Temperatures}$","fontsize",3,"edgecol",5); 
xlabel("$\bf{Wavelength,\lambda(10^{-5} m) \rightarrow}$","fontsize",2,"edgecol",5); 
ylabel("$\bf{Spectral\;Radiance,B_\mu(10^{10}W.sr^{-1}.m^{-3}) \rightarrow}$","fontsize",2,"edgecol",5); 
xgrid();
L1=legend(["T="+string(T1)+"K","T="+string(T2)+"K","T="+string(T3)+"K"],1);
L1.font_size=2;
L1.font_style=2;
figaxes=gca(); //gets the current axes
figaxes.box="on"; //puts the diagram in a box
figaxes.data_bounds=[0 0;2 3]; //sets the axes limit


























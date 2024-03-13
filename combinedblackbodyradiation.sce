//Compare Planck's Law with Wien's law and Raleigh-Jean's Law

clear;funcprot(0);clc;clf;
h=6.62607015e-34;
c=2.998e8;
kB=1.380649e-23;
T=5800;
N=60;
nu=linspace(0,1400e12,N)';
function [fun]=RJ(T)
    for i=1:N
        fun(i)=(2*nu(i)^2*kB*T)/c^2
    end
endfunction
function [fun]=Wien(T)
    for i=1:N
        fun(i)=(2*h*nu(i)^3/c^2)*exp(-(h*nu(i))/(kB*T))
    end
endfunction
function [fun]=Planck(T)
    for i=1:N
        fun(i)=(2*h*nu(i)^3/c^2)*(1/(exp(h*nu(i)/(kB*T))-1))
    end
endfunction
plot(nu./1e12,Planck(T)./1e-9,'r.-');
plot(nu./1e12,Wien(T)./1e-9,'--m*');
plot(nu./1e12,RJ(T)./1e-9,'b-.>');
figaxes=gca();
figaxes.box="on";
figaxes.data_bounds=[0 0;1400 50];
title("$\bf{Comparison\;of\;Black\;Body\;Radiation\;Laws\;at\;T="+string(T)+"K}$","fontsize",4,"edgecol",5);
xlabel("$\bf{Frequency,\nu(THz) \rightarrow}$","fontsize",3,"edgecol",5);
ylabel("$\bf{Spectral\;Radiance,B_{\nu}(nW.sr^{-1}.m^{-2}.Hz^{-1}) \rightarrow}$","fontsize",3,"edgecol",5);
L1=legend(['Planck''s Law','Wien''s Approximation','Raleigh-Jean''s Law'],1);
L1.font_size=2;
L1.font_style=2;

















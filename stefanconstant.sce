//Find the Stefan's constant using Planck's radiation formula.

funcprot(0);
clear;clc;clf;
h=6.62607015e-34;
c=299792458;
kB=1.380649e-23;
pi=%pi;
function [p,E]=planckf(nu,T)
    p=(8*pi*h*nu^3/c^3)./(exp((h*nu)./(kB*T))-1)
    E=(c/4)*integrate('(8*pi*h*nu^3/c^3)./(exp((h*nu)./(kB*T))-1)','nu',0,2e14)
endfunction
function [m,g]=Q(x,y)
    m=sum((x-mean(x)).*(y-mean(y)))/sum((x-mean(x)).^2)
    g=mean(y)-m*mean(x)
endfunction
N=300;
nu=linspace(1,2e14,N);
T=200:100:700;
i=0;
for T1=T
    i=i+1
    [E,E_A(i)]=planckf(nu,T1)
    subplot(2,3,i)
    plot2d3(nu./1e12,E./1e-21,i)
    title("$\bf{Planck''s\;Radiation\;Law:At\;T="+string(T1)+"K}$","fontsize",4,"edgecol",5)
    xlabel("$\bf{Frequency,\nu(THz)}$","fontsize",3,"edgecol",5)
    ylabel("$\bf{Spectral\;Energy\;Density,E\nu(zJs^{-1}m^{-2})}$","fontsize",3,"edgecol",5)
    a=gca()
    a.box="on"
end
x=log(T.');
y=log(E_A);
[m,g]=Q(x,y);
Sigma=exp(g);
mprintf("\nTemperature Exponent\nm=%f\nSigma=%eW/(m^2K^4)",m,Sigma);


























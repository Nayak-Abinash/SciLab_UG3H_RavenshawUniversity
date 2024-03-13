//Determine the Wien's constant by comparing Planck's curves at different temperatures

funcprot(0);
clear;
//clc;
clf;
h=6.62607015e-34;
c=299792458;
kB=1.380649e-23;
pi=%pi;
function fun=planckf(lambda,T)
    fun=(8*pi*h*c./lambda^5)./(exp((h*c)./(lambda*kB*T))-1)
endfunction
N=200;
lambda=linspace(1e-7,5e-5,N);
i=0;
for T=200:200:1200;
    i=i+1
    E=planckf(lambda,T)
    [E_max,m]=max(E)
    lambda_max(i)=lambda(m)
    l(i)="$\bf{T="+string(T)+"K,\lambda_{max}="+string(lambda_max(i))+"m,b="+string(T*lambda_max(i))+"mK}$"
    subplot(2,1,1)
    plot2d(lambda,E,i)
end
L1=legend(l);
L1.font_size=2;
a=gca();
a.thickness=3;
a.children.children.thickness=4;
a.box="on";
title("$\bf{Planck''s\;Radiation\;Law}$","fontsize",4,"color",5,"edgecol",1);
xlabel("$\bf{Wavelength,\lambda(m)}$","fontsize",4,"color",5,"edgecol",1);
ylabel("$\bf{Spectral\;Energy\;Density,E_{\lambda}}$","fontsize",3,"color",5,"edgecol",1);
T=200:200:1200;
x=1./T.';
y=lambda_max;
b=sum((x-mean(x)).*(y-mean(y)))/sum((x-mean(x)).^2);
mprintf("\nWiens displacement constant,\nb=%emK",b);
subplot(2,1,2);
Z=linspace(0,7e-3,length(x));
plot2d(Z,b*Z/1e-6,5);
plot2d(x,y/1e-6,-2);
a=gca();
a.thickness=3;
a.children.children.thickness=4;
a.box="on";
title("$\bf{Variation\;of\;\frac{1}{T}\;with\;\lambda_{max}}$","fontsize",4,"color",5,"edgecol",1);
xlabel("$\bf{\frac{1}{T}(K^{-1})}$","fontsize",4,"color",5,"edgecol",1);
ylabel("$\bf{\lambda_{max(\mu m)}}$","fontsize",5,"color",5,"edgecol",1);
L2=legend(['Curve Fitting Straight Line';'x and y Data Points'],4);
L2.font_size=2;
L2.font_style=4;





























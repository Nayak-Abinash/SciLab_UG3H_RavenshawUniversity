funcprot(0);
clc;
//clf;
clear;
TD=400;//the debye temperature for Aluminium
function fun=Debye(Td)
    fun=3.*(Td).^3.*integrate('x^4*exp(x)/(exp(x)-1)^2','x',0,1./Td)
endfunction
function fun=EDF(Td)
    fun=(9/16).*(1./Td.^2).*exp(3./(4.*Td)).*(1./(exp(3./(4.*Td))-1)^2)
endfunction
function fun=DP(Td)
    fun=Td.^0
endfunction
x=linspace(0.01,1.5,100);
plot(x,Debye(x),"black--");
plot(x,EDF(x),"black");
plot(x,DP(x),'red.');


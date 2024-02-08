//Q: Compare the Maxwell-Boltzmann, Fermi-Dirac, Bose-Einstein distributions

funcprot();clc;clf;clear;
N=1000;
E=linspace(-4,4,N);
T=300;
//Maxwell-Boltzmann:
function [MB]=Maxwell_Boltzmann(T)
    for i=1:N
        MB(i)=1/exp(E(i));
    end
endfunction
plot2d(E,Maxwell_Boltzmann(T),1); 
//Fermi-Driac:
function [FD]=Fermi_Dirac(T)
    for i=1:N
        FD(i)=1/(exp(E(i)) + 1);
    end
endfunction
plot2d(E,Fermi_Dirac(T),2); 
//Bose-Einstein:
function [BE]=Bose_Einstein(T)
    for i=1:N
        BE(i)=1/(exp(E(i)) - 1);
    end
endfunction
plot2d(E,Bose_Einstein(T),3);
set(gca(),'data_bounds',[-4,0;4,3])
//xgrid();
title("Compare of average occupancy of three statistics");
xlabel("Energy of the state");
ylabel("Average occupancy of the state");

//Q: Compare the Maxwell-Boltzmann, Fermi-Dirac, Bose-Einstein distributions

funcprot();clc;clf;clear;
N=60;
E=linspace(-4,4,N)';
T=300;
//Maxwell-Boltzmann:
function [MB]=Maxwell_Boltzmann(T)
    for i=1:N
        MB(i)=1/exp(E(i))
    end
endfunction
//Fermi-Driac:
function [FD]=Fermi_Dirac(T)
    for i=1:N
        FD(i)=1/(exp(E(i)) + 1)
    end
endfunction

//Bose-Einstein:
function [BE]=Bose_Einstein(T)
    for i=1:N
        if E(i)>0 then
            BE(i)=1/(exp(E(i)) - 1)
        else
            BE(i)=100
        end
    end
endfunction
plot(E,Maxwell_Boltzmann(T),'r.-');
plot(E,Fermi_Dirac(T),'--m*');
plot(E,Bose_Einstein(T),'b.->');
title("$\bf{Comparing\;<N_i>\;for\;the\;three\;statistics\;at\;T="+string(T)+"K}$","fontsize",3,"edgecol",5); 
xlabel("$\bf{(\epsilon_i-\mu)/k_B T \rightarrow}$","fontsize",2,"edgecol",5); 
ylabel("$\bf{Average\;Occupancy\;of\;the\;State\;,<N_i> \rightarrow}$","fontsize",2,"edgecol",5); 
xgrid();
L1=legend(["Maxwell-Boltzmann","Fermi-Dirac","Bose-Einstein"],1);
L1.font_size=2;
L1.font_style=2;
figaxes=gca(); //gets the current axes
figaxes.box="on"; //puts the diagram in a box
figaxes.data_bounds=[-4 0;4 3]; //sets the axes limit















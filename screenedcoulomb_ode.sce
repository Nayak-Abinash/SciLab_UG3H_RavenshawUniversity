
funcprot(0); 
clear; 
clc; 
clf; 

e=3.795; m=0.511D6; h=1973; 

c1= -2*m*e*e/(h*h); 
c2= -2*m/(h*h); 

ri=0.00001;rf=8; 
ui=0.0;dui=1; 
h=0.05; 
n=1+(rf-ri)/h; 
r=ri:h:rf; 

a1=3;a2=5;a3=7;
//////a=3 Angstrom
E101=-9
E102=-10
function du=f1(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*(1/r)*exp(-r/a1) + c2*E*u(1)
endfunction

for i=1:100 
    u101=ode([ui;dui],ri,r,list(f1,E101))
    u102=ode([ui;dui],ri,r,list(f1,E102))
    E103=(E101+E102)/2
    u103=ode([ui;dui],ri,r,list(f1,E103)) 
    if (u101(1,n)*u103(1,n))<0 then 
        E102=E103
    else
        E101=E103
    end
end
disp("The Ground State energy(eV) is",E103); 
//////a=5 Angstrom
E201=-10
E202=-11
function du=f2(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*(1/r)*exp(-r/a2) + c2*E*u(1)
endfunction

for i=1:100 
    u201=ode([ui;dui],ri,r,list(f2,E201))
    u202=ode([ui;dui],ri,r,list(f2,E202))
    E203=(E201+E202)/2
    u203=ode([ui;dui],ri,r,list(f2,E203)) 
    if (u201(1,n)*u203(1,n))<0 then 
        E202=E203
    else
        E201=E203
    end
end
disp("The Ground State energy(eV) is",E203); 
//////a=7 Angstrom
E301=-11
E302=-12
function du=f3(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*(1/r)*exp(-r/a3) + c2*E*u(1)
endfunction

for i=1:100 
    u301=ode([ui;dui],ri,r,list(f3,E301))
    u302=ode([ui;dui],ri,r,list(f3,E302))
    E303=(E301+E302)/2
    u303=ode([ui;dui],ri,r,list(f3,E303)) 
    if (u301(1,n)*u303(1,n))<0 then 
        E302=E303
    else
        E301=E303
    end
end
disp("The Ground State energy(eV) is",E303); 
zm=zeros(1,n); 
plot(r,u103(1,:),'r-*',r,u203(1,:),'-+',r,u303(1,:),'->',r,zm(1:n),'black--'); 

a=gca(); 
a.thickness=2; 
a.box="on"; 
a.children.children.thickness=1; 
title("Energy Eigenfunctions","fontsize",4,"fontname",2); 
xlabel("r in Angstrom","fontsize",3,"fontname",3); 
ylabel("Wave Function","fontsize",3,"fontname",3);  
legend(["Ground State( "+string(E103)+"ev) for a= "+string(a1)+"A","Ground State( "+string(E203)+"ev) for a= "+string(a2)+"A","Ground State( "+string(E303)+"ev) for a= "+string(a3)+"A"],[1]);

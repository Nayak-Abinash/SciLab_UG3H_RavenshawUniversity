
funcprot(0); 
clear; 
clc; 
clf; 

k=100; m=940; h=197.3; 

c1= 2*m/(h*h); 
c2= -2*m/(h*h); 

ri=0.00001;rf=5; 
ui=0.0;dui=1; 
h=0.05; 
n=1+(rf-ri)/h; 
r=ri:h:rf; 

b1=0;b2=10;b3=30;
//////b=0 
E101=90
E102=110
function du=f1(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*k*r*r/2 + c1*u(1)*b1*r*r*r/3 + c2*E*u(1)
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
//////b=10 
E201=90
E202=110
function du=f2(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*k*r*r/2 + c1*u(1)*b2*r*r*r/3 + c2*E*u(1)
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
//////b=30 
E301=90
E302=110
function du=f3(r,u,E)
    du(1)=u(2)
    du(2)=c1*u(1)*k*r*r/2 + c1*u(1)*b3*r*r*r/3 + c2*E*u(1)
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
xlabel("r in FemtoMeter","fontsize",3,"fontname",3); 
ylabel("Wave Function","fontsize",3,"fontname",3); 
legend(["Ground State( "+string(E103)+"ev) for b= "+string(b1)+"MeV/fm^3","Ground State( "+string(E203)+"ev) for b= "+string(b2)+"MeV/fm^3","Ground State( "+string(E303)+"ev) for b= "+string(b3)+"MeV/fm^3"],[1]);

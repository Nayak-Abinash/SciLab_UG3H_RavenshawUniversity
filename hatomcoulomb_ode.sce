//Q: Solve the Radial Schrodinger's Equation(RSE) for an H-atom 
// in Coulomb Potential(CP) using the ODE function in scilab

//First, we need to acquaint ourselves with solving 
// Second-Order Differential Equations(SDE) using the ODE function.
//Recall that you have done this in the 3rd semester. 
//This ought to be a good time to refresh those memories. 


funcprot(0); //lets you redefine functions without hassle
clear; //clears residual variable values
clc; //clears the console for a clean reading
clf; //clears the figure console of previous plots

e=3.795; m=0.511D6; h=1973; //we define the necessary parameters 
// needed for our calculations in units of eV(electron volts). 
//Can you guess why??

//Now the RSE is in the form 
//          u''(r) = [2m/h^2][V(r)-E]u(r) with V(r)= -e^2/r
// to let the program interpret it clearly we expand the RHS 
// and write it as 
//          u''(r) = c1 u(r)/r + c2 E u(r)

c1= -2*m*e*e/(h*h); //value of c1
c2= -2*m/(h*h); //value of c2

//Recall that when we solved SDEs using ODEs we essentially had
// two unknowns(i.e. x & y) and two simultaneous equations. 
//Here we have a third unknown, E. We obviously can not solve for 
// all three at once. We do the next best thing and give estimates
// for E and see for which value the solutions are physical.
//Ideally, we should do a full scan of the entire energy spectrum,
// which is painstakingly rigorous and takes time. Hence, we do 
// the next best thing and through trial and error find intervals 
// where a eigenfunction may lie.

E01=-10
//input("Enter 1st Guess for Energy(eV):"); //provide one end of 
// the interval e.g. -10 (for the ground state solution)
E02=-15
//input("Enter 2nd Guess for Energy(eV):"); //enter the other end
// e.g. -20 (for the ground state solution)
E11=-2 //provide one end of 
// the interval e.g. -2 (for the 1st excited state solution)
E12=-4 //enter the other end
// e.g. -4 (for the 1st excited state solution)

function du=f(r,u,E) //here we put u(r) and its derivative in 
// the necessary form for the use of ODE
    du(1)=u(2)
    du(2)=c1*u(1)*(1/r) + c2*E*u(1)
endfunction

ri=0.00001;rf=8; //we define the r spectrum
ui=0.0;dui=1; //defines the intitial conditions
h=0.05; //defines the step size, be judicious in this choice
n=1+(rf-ri)/h; //evaluates the last index in the array of r or u
r=ri:h:rf; //defines an array of r-values

//The following loop is for the ground state
for i=1:100 //starting a loop
    u01=ode([ui;dui],ri,r,list(f,E01)) //solves for u(r) with E=E01
    u02=ode([ui;dui],ri,r,list(f,E02)) //solves for u(r) with E=E02
    E03=(E01+E02)/2 //takes the average of E01,E02
    u03=ode([ui;dui],ri,r,list(f,E03)) //solves for u(r) with E=E03
    if (u01(1,n)*u03(1,n))<0 then //implementing the IVT and 
// the Bisection Algorithm
        E02=E03
    else
        E01=E03
    end
end

//The following loop is for the first excited state
for i=1:100 //starting a loop
    u11=ode([ui;dui],ri,r,list(f,E11)) //solves for u(r) with E=E11
    u12=ode([ui;dui],ri,r,list(f,E12)) //solves for u(r) with E=E12
    E13=(E11+E12)/2 //takes the average of E11,E12
    u13=ode([ui;dui],ri,r,list(f,E13)) //solves for u(r) with E=E13
    if (u11(1,n)*u13(1,n))<0 then //implementing the IVT and 
// the Bisection Algorithm
        E12=E13
    else
        E11=E13
    end
end

disp("The Ground State energy(eV) is",E03); //displaying 
// the eigenvalue(eV)
disp("The First Excited State energy(eV) is",E13); //displaying 
// the eigenvalue(eV)
zm=zeros(1,n); //list of zeroes, we want to plot u=0 as a reference
plot(r,u03(1,:),'r-*',r,u13(1,:),'-+',r,zm(1:n),'black--'); 
//Plotting the eigenfunction or energy wavefunction against r(angstrom).

//Cosmetics for your plot
a=gca(); //gets the current axes
a.thickness=2; //sets axes thickness
a.box="on"; //puts a box around the plot
a.children.children.thickness=1; //sets thickness of the curves
title("Energy Eigenfunctions","fontsize",4,"fontname",2); //sets plot title 
xlabel("r in Angstrom","fontsize",3,"fontname",3); //sets x-label
ylabel("Wave Function","fontsize",3,"fontname",3); //sets y-label
legend(["Ground State( "+string(E03)+"ev)","Ground State( "+string(E13)+"ev)"],[4]); 
//puts label on different curves inside the plot










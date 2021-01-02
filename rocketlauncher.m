T1 = readtable('horseyOptions.txt');
T2 = readtable('horseyRocketOptions.txt');

g = 9.81; %% m/s^2
dCR = 0.05; % drag ooefficent of rocket
dCP = 1.75; % drag coefficent of parachute
aP = 10; %% m^2
dt=0.1; %% seconds

hAM = (table2array(T1(1,'HorseMass'))); % Horse A Mass
hBM = (table2array(T1(2,'HorseMass'))); % Horse B Mass
hCM = (table2array(T1(3,'HorseMass'))); % Horse C Mass

rAM = (table2array(T2(1,'RocketMass'))); % Rocket A Mass
rBM = (table2array(T2(2,'RocketMass'))); % Rocket B Mass
rCM = (table2array(T2(3,'RocketMass'))); % Rocket C Mass

rAFM = (table2array(T2(1,'FuelMass'))); % Rocket A Fuel Mass
rBFM = (table2array(T2(2,'FuelMass'))); % Rocket B Fuel Mass
rCFM = (table2array(T2(3,'FuelMass'))); % Rocket C Fuel Mass

rAT = (table2array(T2(1,'Thrust'))); % Rocket A Thrust
rBT = (table2array(T2(2,'Thrust'))); % Rocket B Thrust
rCT = (table2array(T2(3,'Thrust'))); % Rocket C Thrust

rABT = (table2array(T2(1,'BurnTime'))); % Rocket A Burntime
rBBT = (table2array(T2(2,'BurnTime'))); % Rocket B Burntime
rCBT = (table2array(T2(3,'BurnTime'))); % Rocket C Burntime

rAD = (table2array(T2(1,'Diameter'))); % Rocket A Diameter
rBD = (table2array(T2(2,'Diameter'))); % Rocket B Diameter
rCD = (table2array(T2(3,'Diameter'))); % Rocket C Diameter

hAN = (table2array(T1(1,'HorseName'))); % Horse A Name
hBN = (table2array(T1(2,'HorseName'))); % Horse B Name
hCN = (table2array(T1(3,'HorseName'))); % Horse C Name

[fT,t,p,v,a,mOF,dra,den] = flightLength(hAM,rAM,rAFM,rAT,rABT,dt,rAD,g,dCR,dCP,aP);
% placing all horse A and rocket A attributes into flightLenght function to
% perform simulation
impVel = abs((kaboomSpeed(v,t,fT)));
maxH = maxHeight((p));
fprintf('%9s: \tFlight time: %.1f s \n',hAN{:},fT);
fprintf('\t\t\tImpact velocity: %.2f m/s \n',impVel);
fprintf('\t\t\tMax height: %.2f km\n\n',maxH);
velocities1 = v;
positions1 = p; % placing positions array into unique positions1 array
times1 = t;
accelerations1 = a;
massOfFuels1 = mOF;
drags1 = dra;
densities1 = den;

[fT,t,p,v,a,mOF,dra,den] = flightLength(hBM,rBM,rBFM,rBT,rBBT,dt,rBD,g,dCR,dCP,aP);
% placing all horse B and rocket B attributes into flightLenght function to
% perform simulation
impVel = abs((kaboomSpeed(v,t,fT)));
maxH = maxHeight((p));
fprintf('%9s: \tFlight time: %.1f s \n',hBN{:},fT);
fprintf('\t\t\tImpact velocity: %.2f m/s \n',impVel);
fprintf('\t\t\tMax height: %.2f km\n\n',maxH);
velocities2 = v;
positions2 = p;
times2 = t;
accelerations2 = a;
massOfFuels2 = mOF;
drags2 = dra;
densities2 = den;

[fT,t,p,v,a,mOF,dra,den] = flightLength(hCM,rCM,rCFM,rCT,rCBT,dt,rCD,g,dCR,dCP,aP);
% placing all horse C and rocket C attributes into flightLenght function to
% perform simulation
impVel = abs((kaboomSpeed(v,t,fT)));
maxH = maxHeight((p));
fprintf('%9s: \tFlight time: %.1f s \n',hCN{:},fT);
fprintf('\t\t\tImpact velocity: %.2f m/s \n',impVel);
fprintf('\t\t\tMax height: %.2f km\n\n',maxH);
velocities3 = v;
positions3 = p;
times3 = t;
accelerations3 = a;
massOfFuels3 = mOF;
drags3 = dra;
densities3 = den;


plot(times1,accelerations1,'r',times2,accelerations2,'b',times3,accelerations3,'g');
title('Acceleration vs. Time');
xlabel('time - (s)')
ylabel('acceleration - (m/s^2)')
legend(hAN{:},hBN{:},hCN{:});
grid

hold on

figure()
plot(times1,positions1,'r',times2,positions2,'b',times3,positions3,'g');
title('Position vs. Time');
xlabel('time - (s)')
ylabel('height - (m)')
legend(hAN{:},hBN{:},hCN{:});
grid

figure()
plot(times1,velocities1,'r',times2,velocities2,'b',times3,velocities3,'g');
title('Velocity vs. Time');
xlabel('time - (s)')
ylabel('velocity - (m/s)')
legend(hAN{:},hBN{:},hCN{:});
grid

figure()
plot(times1,densities1,'r',times2,densities2,'b',times3,densities3,'g');
title('Density vs. Time');
xlabel('time - (s)')
ylabel('density - (kg/m^3)')
legend(hAN{:},hBN{:},hCN{:},'Location','southeast');
grid

figure()
plot(positions3,densities3,'k');
title('Density vs. Position');
xlabel('height - (m)')
ylabel('density - (kg/m^3)')
grid

figure()
plot(times1,drags1,'r',times2,drags2,'b',times3,drags3,'g');
title('Drag vs. Time');
xlabel('time - (s)')
ylabel('drag - (N)')
legend(hAN{:},hBN{:},hCN{:},'Location','southeast');
grid

figure()
plot(times1,massOfFuels1,'r',times2,massOfFuels2,'b',times3,massOfFuels3,'g');
title('Mass of Fuel vs. Time');
xlabel('time - (s)')
ylabel('mass of fuel - (kg)')
legend(hAN{:},hBN{:},hCN{:});
grid

hold off

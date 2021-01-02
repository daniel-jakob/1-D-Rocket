%%
%% flightLenght.m
function [fT,t,p,v,a,mOF,dra,den] = flightLength(hM,rM,fM,rT,bT,dt,d,g,draCR,draCP,aP)

radius = (d/2); % diamter to radius
areaRocket = pi*radius^2; % relevant area of rocket
accel = zeros(1,10000);         % empty
velocity =  zeros(1,10000);     % arrays 
position = zeros(1,10000);      % to
time = zeros(1,10000);          % store 
massOfFuel = zeros(1,10000);    % 
dra = zeros(1,10000);
den = zeros(1,10000);

initialVel = 0;
initialPos = 0;

for t = 1:1:10000
    
    totalMass = (hM + rM + findWeight(t,fM,bT,dt)); 
    totalWeight = totalMass * g;
    
    drag = findDrag(initialPos, initialVel, areaRocket, draCR);
    
    if initialVel < 0
        drag = -drag; % inverting drag when returning back towards ground
    if initialPos < 10000 % deployment of parachute when below 10k
        drag = drag - findDrag(initialPos, initialVel, aP, draCP);
    end
    end
    
    if t <= (bT/dt)
        accel(t) = ((rT-totalWeight-drag)/totalMass); % accel w/ boosters firing
    else  
        accel(t) = ((-totalWeight-drag)/totalMass); % accel after burntime 
    end
    
    newVel = initialVel + accel(find(accel,1,'last'))*dt; % finding current vel
    initialVel = newVel;
    
    newPos = initialPos + newVel*dt; % finding current position
    initialPos = newPos;
    
    velocity = cumtrapz(time,accel);
    position = cumtrapz(time,velocity);
    position(position<0)=0; % position cannot be negative
    massOfFuel(t) = ((findWeight(t,fM,bT,dt)));
    time(t) = t*dt;
    dra(t) = drag;
    den(t) = findDensity(initialPos);
    
    if initialPos <= 0
        break % breaks for loop when rocket goes impacts ground
    end
    
end

fT = (t-1)*dt;
p = position(1:t-1);
v = velocity(1:t-1);
a = accel(1:t-1);
mOF = massOfFuel(1:t-1);
den = den(1:t-1);
dra = dra(1:t-1);
t = time(1:t-1);

end
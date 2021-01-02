%% 
%% findWeight.m
function [newFuelMass] = findWeight(time,fuelMass,burnTime,dt)
fuelBurnedPerDt = (fuelMass/burnTime)*dt;
newFuelMass = (fuelMass - (fuelBurnedPerDt * (time)));
if newFuelMass < 0 
    newFuelMass = 0; %% fuel weight cannot be negative 
end
end
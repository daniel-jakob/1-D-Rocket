%%
%% kaboomSpeed.m
function [impactVelocity] = kaboomSpeed(velocities,time,flightTime)
impactVelocity = (interp1(time, velocities, flightTime, 'spline'));
end


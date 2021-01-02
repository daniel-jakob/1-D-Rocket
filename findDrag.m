%%
%% findDrag.m
function [Drag] = findDrag(H,v,area,dragCoeff)
Drag = ((dragCoeff * (findDensity(H) * v^2)/2) * area); 
end
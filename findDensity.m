%%
%% findDensity.m
function [Density] = findDensity(Height)
D = load ('atmosphereDensities.txt'); % makes a 1000 x 2 table
A = D(:,2).*1000; % converting g/cm-3 to kg/m-3 and saves it to the array A
D = D(:,1); % makes the 1000 x 2 table into a 1000 x 1 table of heights in km
Density = interp1(D,A,Height/1000,'spline'); % cubicly interpolates the two arrays 
end


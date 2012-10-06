function [q,g,h,r]=b(p,e,u,time)
%b        Boundary condition data

%{
bl=[
0 % the dimension N of the system, 0 <= x <= 1 %
1 % number M of Dirichlet boundary conditions.
1 % lengths for the strings representing q.
1 % lengths for the strings representing g.
1 % lengths for the strings representing h. 
1 % contain the lengths for the strings representing r.
%{ The following rows contain text expressions representing the actual boundary condition functions. The text strings have the lengths according to above. The MATLAB text expressions are stored in columnwise order with respect to matrices h and q. There are no separation characters between the strings. %}
48 % 48 <= x <= 57
48
49
48
];
%}

%infinitywall =  [1 0 1 1 49 48 48 48 48 48]'; % Neumann

sphere =      [1 1 1 1 1 1 48 48 49 50]';% Dirichlet & Neumann
infinitywall = [1 1 1 1 1 1 48 48 49 50]';% Dirichlet & Neumann
% infinitywall = [1 0 1 1 48 48 48 48 48 48]';% Neumann
electrode =  [1 0 1 1 49 48 48 48 48 48]'; % Neumann
upperwall =  [1 0 1 1 48 48 49 49 49 49]'; % Neumann
lowerwall =  [1 0 1 1 48 48 49 49 49 49]'; % Neumann


% boundary conditions
%{
sphere =      [1 0 1 1 49 49 48 48 49 48]';
infinitywall = [1 1 1 1 1   1   48 48 48 48]';
electrode = [1 1 1 1 1 1 48 48 49 48]';
upperwall = [1 0 1 1 48 48 48 48 49 48]';
lowerwall = [1 0 1 1 48 48 48 48 49 48]';
%}
%{
2
1
lq11
lq21
lq12
lq22
lg1
lg2
lh11
lh12
lr1
q11 ...
q21 ...
q12 ...
q22 ...
g1 ...
g2 ...
h11 ...
h12 ...
r1 ...
%}

bl = [sphere, electrode, upperwall, infinitywall, lowerwall];

if any(size(u))
  [q,g,h,r]=pdeexpd(p,e,u,time,bl);
else
  [q,g,h,r]=pdeexpd(p,e,time,bl);
end


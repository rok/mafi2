%pdegplot('rokg'), axis equal 
g='rokg';
[p,e,t]=mesh(g); 
%[p,e,t]=refinemesh(g,p,e,t); 
pdemesh(p,e,t), axis equal

% u=assempde('cardb',p,e,t,1,0,1); 
% pdesurf(p,t,u);
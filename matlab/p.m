function p
close
presek
hold on;
figure(1)

[p,e,t]=initmesh('g','Hmax',0.1);
[p,e,t]=refinemesh('g',p,e,t);
[p,e,t]=refinemesh('g',p,e,t);
%[p,e,t]=refinemesh('g',p,e,t);
%[p,e,t]=refinemesh('g',p,e,t);
p=jigglemesh(p,e,t,'opt','mean','iter',inf);
[p,e,t]=refinemesh('g',p,e,t);

% pdemesh(p,e,t), axis equal
% pdegplot('g'); % Plot geometrije

u=assempde('b',p,e,t,1,1,1); % c a f d
% pdeplot(p,e,t,'xydata',u,'mesh','off','levels',20,'colormap',jet)
% pdeplot(p,e,t,'xydata',u,'zdata',u,'mesh','off','flowstyle', 'arrow','levels',20,'colormap',jet,'title','Naslov');
pdeplot(p,e,t,'xydata',u,'contour','on','colormap',jet);
% pdeplot(p,e,t,'xydata',u,'zdata',u,'colormap',jet,'title','Crte!!!');
axis tight, set(gca,'DataAspectRatio',[1 1 1]);

% x=linspace(0,3,100);
% y=linspace(-0.5,0.5,100);
% uxy=tri2grid(p,t,u,x,y);
% z = uxy(50,:)
% plot(x,z)

x=linspace(0,3,15);
y=linspace(-1,1,15);
uxy=tri2grid(p,t,u,x,y);
hold on
[U,V] = gradient(uxy,.1);
quiver(x,y,U,V);
ylabel('r [ ]');
xlabel('z [ ]');
title('Potencial konice nanocevke, r0=0.1','FontSize',14);
print -dpng -r200 slika01.png
hold off
%close
%surf(x,y,uxy)

%TO-DO: POMEMBNO
% 1 - sprogramiraj prerez(r,d) (r je premer nanocevke, d je oddaljenost od anode)
% 2 - izraèunaj dovolj prerzov za 'fazni diagram' teh prerezov


% u=assempde('boundaryconds.file',...); %u is your solution of the PDE
% pdeplot(...); %this gives you the plot of the solution in 2D

end
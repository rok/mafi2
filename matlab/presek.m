function presek
close

r0 = 0.1; % polmer sfere
x0 = 1; % lokacija sfere
x1 = 1; % razdalja od ozemljene plošèe
x2 = 2; % prazen prostor za sfero
h = 1; % polmer cilindra

figure(2)
[p,e,t]=initmesh('g','Hmax',0.1);
[p,e,t]=refinemesh('g',p,e,t);
%[p,e,t]=refinemesh('g',p,e,t);
%[p,e,t]=refinemesh('g',p,e,t);
%[p,e,t]=refinemesh('g',p,e,t);
p=jigglemesh(p,e,t,'opt','mean','iter',inf);
[p,e,t]=refinemesh('g',p,e,t);

% u=assempde('b',p,e,t,1,0,0); % c a f d
u=assempde('b',p,e,t,1,1,1); % c a f d
axis tight, set(gca,'DataAspectRatio',[1 1 1]);

uxy=tri2grid(p,t,u,linspace(0,x1+x2,300),linspace(-h,h,200));

subplot(2,2,1)
plot(linspace(0,x1+x2,300),uxy(100,:));
axis tight
title('fi = 0, r0=0.1','FontSize',12);
ylabel('U(z) [ ]');
xlabel('z [ ]');

subplot(2,2,2)
plot(linspace(0,2*sqrt(x1^2+h^2),200),diag(uxy));
axis tight
title('fi = 45, r0=0.1','FontSize',12);
ylabel('U(sqrt(z^2+r^2)) [ ]');
xlabel('sqrt(z^2+r^2) [ ]');

subplot(2,2,3)
plot(linspace(r0,h,100),uxy(101:end,50));
axis tight
title('fi = 90, r0=0.5','FontSize',12);
ylabel('U(r) [ ]');
xlabel('r [ ]');

subplot(2,2,4)
plot(linspace(-h,h,200),uxy(:,1));
axis tight
title('fi = 90, z = 0, r0=0.1','FontSize',12);
ylabel('U(r) [ ]');
xlabel('r [ ]');

print -dpng -r200 presek01.png
close

%TO-DO: POMEMBNO
% 1 - sprogramiraj prerez(r,d) (r je premer nanocevke, d je oddaljenost od anode)
% 2 - izraèunaj dovolj prerzov za 'fazni diagram' teh prerezov

end
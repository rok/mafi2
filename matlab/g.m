function [x,y]=g(bs,s,r1)

nbs=5;

if nargin==0,
  x=nbs; % number of boundary segments
  return
end

r0 = 0.1; % polmer sfere
x0 = 1; % lokacija sfere
x1 = 1; % razdalja od ozemljene plošèe
x2 = 2; % prazen prostor za sfero
h = 1; % polmer cilindra

d=[
  0     0 0 0 0 % start parameter value
  2*pi 1 1 1 1 % end parameter value
  0     0 0 0 0 % left hand region
  1     1 1 1 1 % right hand region
];

bs1=bs(:)';

if find(bs1<1 | bs1>nbs),
  error('PDE:squareg:InvalidBs', 'Non existent boundary segment number.')
end

if nargin==1,
  x=d(:,bs1);
  return
end

x=zeros(size(s));
y=zeros(size(s));
[m,n]=size(bs);
if m==1 && n==1,
  bs=bs*ones(size(s)); % expand bs
elseif m~=size(s,1) || n~=size(s,2),
  error('PDE:squareg:SizeBs', 'bs must be scalar or of same size as s.');
end

if ~isempty(s),

% boundary segment 1
ii=find(bs==1);
x(ii)=x0-r0*cos(s(ii));
y(ii)=-r0*sin(s(ii));

% boundary segment 2
ii=find(bs==2);
if length(ii)
x(ii)=interp1([0 1],[x0-x1 x0-x1],s(ii));
y(ii)=interp1([0 1],[-h, h],s(ii));
end

% boundary segment 3
ii=find(bs==3);
if length(ii)
x(ii)=interp1([0 1],[x0-x1 x0+x2],s(ii));
y(ii)=interp1([0 1],[h h],s(ii));
end

% boundary segment 4
ii=find(bs==4);
if length(ii)
x(ii)=interp1([0 1],[x0+x2 x0+x2],s(ii));
y(ii)=interp1([0 1],[h -h],s(ii));
end

% boundary segment 5
ii=find(bs==5);
if length(ii)
x(ii)=interp1([0 1],[x0+x2 x0-x1],s(ii));
y(ii)=interp1([0 1],[-h -h],s(ii));
end

end
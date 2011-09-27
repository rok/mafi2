function [x,y]=rokg(bs,s)

nbs=8;

if nargin==0,
  x=nbs; % number of boundary segments
  return
end

r0=0.5;
D=10;
offset=-5;
d=3;

f=[
  0    pi/2 pi     pi*3/2 0 0 0 0 % start parameter value
  pi/2 pi   pi*3/2 2*pi   1 1 1 1 % end parameter value
  0    0    0      0      0 0 0 0 % left hand region
  1    1    1      1      1 1 1 1 % right hand region
];

bs1=bs(:)';

if find(bs1<1 | bs1>nbs),
  error('PDE:squareg:InvalidBs', 'Non existent boundary segment number.')
end

if nargin==1,
  x=f(:,bs1);
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
x(ii)=r0*cos(s(ii));
y(ii)=r0*sin(s(ii));

% boundary segment 2
ii=find(bs==2);
x(ii)=r0*cos(s(ii));
y(ii)=r0*sin(s(ii));

% boundary segment 3
ii=find(bs==3);
x(ii)=r0*cos(s(ii));
y(ii)=r0*sin(s(ii));

% boundary segment 4
ii=find(bs==4);
x(ii)=r0*cos(s(ii));
y(ii)=r0*sin(s(ii));

% boundary segment 5
ii=find(bs==5);
if length(ii)
x(ii)=interp1([f(1,5),f(2,5)],[-D-offset D-offset],s(ii));
y(ii)=interp1([f(1,5),f(2,5)],[d d],s(ii));
end

% boundary segment 6
ii=find(bs==6);
if length(ii)
x(ii)=interp1([f(1,6),f(2,6)],[D-offset D-offset],s(ii));
y(ii)=interp1([f(1,6),f(2,6)],[d -d],s(ii));
end

% boundary segment 7
ii=find(bs==7);
if length(ii)
x(ii)=interp1([f(1,7),f(2,7)],[D-offset -D-offset],s(ii));
y(ii)=interp1([f(1,7),f(2,7)],[-d -d],s(ii));
end

% boundary segment 8
ii=find(bs==8);
if length(ii)
x(ii)=interp1([f(1,8),f(2,8)],[-D-offset -D-offset],s(ii));
y(ii)=interp1([f(1,8),f(2,8)],[-d d],s(ii));
end

end
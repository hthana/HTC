function [mX,mY,cX,cY,oX,oY]=makeCenterLine(x1,y1,x2,y2)

if length(x1)<length(x2)
    x=x1; y=y1;
    xp=x2; yp=y2;
else
    x=x2; y=y2;
    xp=x1; yp=y1;
end
l=length(x);
seg=25;

interval=floor(l/seg);
q=3;

hX=x1(1);   %make the head the first point
hY=y1(1);
tX=x1(end);
tY=y1(end);

cX=[];
cY=[];

% x=[x(end-2:end) x x(1:3)];
% y=[y(end-2:end) y y(1:3)];

% for i=3+interval:interval:(seg-2)*interval+3
for i=2*interval:interval:length(x)-2*interval
        v=[ mean(diff(y(i-q:i+q))); -mean(diff(x(i-q:i+q)))];
        vu=v/sqrt(v(1)^2+v(2)^2);   %vu is a unit vector
        [closestx,closesty]=minimizeDistance(vu,xp,yp,x(i),y(i));
        closestx=closestx(1);
        closesty=closesty(1);   %this may cause errors, but I'm not quite sure how to deal with it yet.
        cX=[cX closestx];
        cY=[cY closesty];
end

% cX=[cX x(end)]; %make the tail the last point
% cY=[cY y(end)];
% oX=[x(1) x(interval:interval:(seg-2)*interval) x(end)];
% oY=[y(1) y(interval:interval:(seg-2)*interval) y(end)];
oX=x(2*interval:interval:length(x)-2*interval);
oY=y(2*interval:interval:length(x)-2*interval);

mX=zeros(1,length(cX));
mY=zeros(1,length(cX));
for i=1:length(cX)
    [mX(i),mY(i)]=midpoint(cX(i),cY(i),oX(i),oY(i));
end
mX=[hX mX tX];
mY=[hY mY tY];

mXi=interp(mX,8);   %interpolate to get a proper spline curve
mYi=interp(mY,8);
mXi=mXi(1:end-7);
mYi=mYi(1:end-7);

mX=mXi;
mY=mYi;



f=figure;
plot(x1,y1);
hold on
plot(x2,y2,'r');
plot(mX,mY,'k');
plot(hX,hY,'cx','MarkerSize',12)
disp('Produced centerline successfully')
delete(f)



function [closestx,closesty]=minimizeDistance(vector,x,y,x1,y1)   %use projection to find smallest point
a=[x-x1; y-y1];
b=vector;
proj=[];
lengthVectorProj=zeros(1,length(x));
perpendicularDist=zeros(1,length(x));
for i=1:length(x)
    p=dot(a(:,i),b)*b;    %vector projection of a on b
    lp=sqrt(p(1)^2+p(2)^2); %length of the vector projection
    lengtha=sqrt(a(1,i)^2+a(2,i)^2);
    pd=sqrt(lengtha^2-lp^2); %length of the perpendicular distance
    lengthVectorProj(i)=lp;
    perpendicularDist(i)=pd;
end
cp=find(perpendicularDist<1);   %candidate points
cp=findMins(cp,perpendicularDist);
lowestPoint=find(lengthVectorProj(cp)==min(lengthVectorProj(cp)));
lowestPoint=cp(lowestPoint);
closestx=x(lowestPoint); 
closesty=y(lowestPoint);


function cp=findMins(cp,perpDist)
temp=[];
cp=[cp(1) cp];
cpnew=[];
lcp=length(cp);
for i=2:lcp
    if cp(i)-cp(i-1)<2
        temp=[temp cp(i)];
    else
        minimum=find(perpDist(temp)==min(perpDist(temp)));
        minimum=temp(minimum);
        minimum=minimum(1);
        cpnew=[cpnew minimum];
        temp=cp(i);
    end
end
minimum=find(perpDist==min(perpDist(temp)));
cpnew=[cpnew minimum];
cpnew=unique(cpnew);    %I'm not sure why this is necessary.  Clearly there is some bug in the code
cp=cpnew;   %cp contains locations where perpDist is a minimum



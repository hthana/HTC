function [xCorners,yCorners,xPoints,yPoints]=findCorners(x,y,h,bMin)
x=x(1:5:end);
y=y(1:5:end);
xPoints=x;  %x,yPoints are just the lowered resolution points.  This probably will not be needed later.
yPoints=y;
q=2;

xTemp=[x(end-9:end) x x(1:10)];
yTemp=[y(end-9:end) y y(1:10)];
dydx=[];
xCorners=[];
yCorners=[];

b=[];
for i=11:length(xTemp)-10;
    if isClockwise([xTemp(i-q) xTemp(i) xTemp(i+q)],[yTemp(i-q) yTemp(i) yTemp(i+q)])
        xMid=(xTemp(i+q)+xTemp(i-q))/2;
        yMid=(yTemp(i+q)+yTemp(i-q))/2;
        aP=abs(ptDist(xMid,yMid,xTemp(i-q),yTemp(i-q)));
        bP=abs(ptDist(xMid,yMid,xTemp(i),yTemp(i)));

        if bP>bMin    %if bP==0, the points are colinear
            xCorners=[xCorners xTemp(i)];
            yCorners=[yCorners yTemp(i)];
        end
    end
    
end
% figure;plot(b);

function I=isPositive(num)
if abs(num)==num
    I=1;
else
    I=0;
end
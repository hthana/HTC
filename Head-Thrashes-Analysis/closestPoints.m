%This function should find point closest to the reference points from the
%x and y arrays

function [xClosest,yClosest,xNew,yNew]=closestPoints(xRef,yRef,x,y)
oldDist=1e6;
pointNum=0;
for i=1:length(x)
    newDist=ptDist(xRef,yRef,x(i),y(i));
    if newDist<oldDist
        oldDist=newDist;
        pointNum=i; %the 'i'th point coordinate is the closest so far
    end
end

xClosest=x(pointNum);
yClosest=y(pointNum);
x(pointNum)=0;
y(pointNum)=0;
xNew=removeZeros(x);
yNew=removeZeros(y);
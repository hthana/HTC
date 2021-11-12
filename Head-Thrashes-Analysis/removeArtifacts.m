function [xNew,yNew]=removeArtifacts(x,y)
tic
xOriginal=x;
yOriginal=y;
curveLength=0;

while curveLength<.5*length(x)  
    if toc>3; disp('removeArtifacts timed out'); juwlihgiwuhg; end    %timeout
    xCurve=[];
    yCurve=[];
    x=xOriginal;
    y=yOriginal;
    randomStartPoint=randi(length(x),1);
    xPrev=x(randomStartPoint);
    yPrev=y(randomStartPoint);  

    for i=1:length(x)
        if toc>3; disp('removeArtifacts timed out'); juwlihgiwuhg; end    %timeout
        [xClosest,yClosest,xNew,yNew]=closestPoints(xPrev,yPrev,x,y);

        if ptDist(xClosest,yClosest,xPrev,yPrev)<5;     
            %5 is some arbitrary threshold, where we only want to consider this
            %to be a continuous curve if the next point is less than 5 units
            %away from the last one
            xCurve=[xCurve xClosest];
            yCurve=[yCurve yClosest];
            xPrev=xClosest;
            yPrev=yClosest;
            x=xNew;
            y=yNew;
        else
            %if the next point is too far away, we're going to consider it a
            %"bad" point and remove it
            loc=intersect(find(x==xClosest),find(y==yClosest));
            try
                xNew=[x(1:loc-1) x(1:loc+1)];
                yNew=[y(1:loc-1) y(1:loc+1)];
            catch
            end
        end
    end
    
    curveLength=length(xCurve);
end

xNew=xCurve;
yNew=yCurve;
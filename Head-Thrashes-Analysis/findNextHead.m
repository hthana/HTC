function [nextHeadx,nextHeady,nextTailx,nextTaily,angle]=findNextHead(img,preHeadx,preHeady,preTailx,preTaily)


%     imshow (I);
    [x,y,h] = getSkeleton(img);
    
%     disp(x(1))
%     disp(y(1))
%     disp(x(length(x)))
%     disp(y(length(y)))
%     
    
    [xs,ys]=divideSpline(x,y,8);

    dist1 = ptDist(preHeadx,preHeady,xs(1),ys(1));
    dist2 = ptDist(preHeadx,preHeady,xs(length(xs)),ys(length(ys)));
    if  dist1 < dist2
        angle = headBendAngle(xs,ys);
        fprintf('head bend angle is %.2f\n',angle);
        nextHeadx = xs(1);
        nextHeady = ys(1);
        nextTailx = xs(length(xs));
        nextTaily = ys(length(ys));
    else
        tmpx = [];
        tmpy = [];
       
        num = length(xs);
        for i=1:length(xs)
            tmpx(i)= xs(num);
            tmpy(i)= ys(num);
            num = num -1;
        end
        angle = headBendAngle(tmpx,tmpy);
        fprintf('head bend angle is %f\n',angle);
        nextHeadx = tmpx(1);
        nextHeady = tmpy(1);
        nextTailx = tmpx(length(tmpx));
        nextTaily = tmpy(length(tmpy));
        
    end
    
%     
%      disp(xs(1))
%      disp(ys(1))
%      disp(xs(length(xs)))
%      disp(ys(length(ys)))
% 
%     plot(xs,h-ys+1,'.c','MarkerSize',9 ,'color','g')


end
function [ allAngles ] = headThrashesCount(  )
allAngles(1) = 0;
timeArray = [];
angles =[];
trainPath='raw_images\'; 
% trainPath='test\';   
theFiles  = dir([trainPath '*.tif']);
disp(length(theFiles));
count = 1;
train_num = length(theFiles);
sort_nat_name=sort_nat({theFiles.name});  
for k = 1:train_num
    fullFileName = sort_nat_name{k};
    fprintf(1, 'Now reading %s\n', fullFileName);

    I = imread([trainPath fullFileName]);
    count = count +1;
    if k == 1
        [height,width] = size(I);
 
        [x ,y,headx,heady,tailx,taily]=plotDivideSpline(I,0);
        angle = headBendAngle(x,y);
        fprintf('head bend angle is %.2f\n',angle);
         angles = [angles angle];
         
        heady = height - heady ;
        taily = height - taily ;

%         disp(headx);
%         disp(heady);
% 
%         disp(tailx);
% 
%         disp(taily);
        
        continue;
    end
    [newHeadx,newHeady,newTailx,newTaily,ang] = findNextHead(I,headx,heady,tailx,taily);
    headx = newHeadx;
    heady = newHeady;    
    tailx = newTailx;
    taily = newTaily;
    angles = [angles ang];

end

 disp(angles)
 
figure;
plot(angles);
a=length(angles);
anglecha=[];
for t=1:(a-1)
% if t<=a
    anglecha(t)=angles(t)-angles(t+1);
end
disp(anglecha)

x=find( abs(anglecha) < 1);
anglecha(x) = [];

headThrashesnum = 0;

for i = 1:length(anglecha)-1
    if  anglecha(i)>0 && anglecha(i+1)<0
        headThrashesnum = headThrashesnum + 1;
    end
end

fprintf('The number of head thrashes are %d\n', headThrashesnum) 

end


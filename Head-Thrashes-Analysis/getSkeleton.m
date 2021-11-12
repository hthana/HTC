function [X,Y,h] = getSkeleton(B)
%
    kk=~B;
    mm=bwmorph(skeleton(kk)>35,'skel',Inf); % tune this parameter
    

%     se = strel('disk',1);                   % tune this parameter
%     se = strel('square',1);
    
    imshow(mm);
    hold on
    
    [x,y] = find(mm==1);
        
   [height,width] = size(mm);
   h = height;
%     [X,Y] = find(mm==1);
    
   
    x1 = [];
    y1 = [];
   
    for idx = 1:length(x)
        newX = y(idx);
%         newX = Y1(idx);
        newY = height - x(idx);
%         newY = x(idx);
        x1(idx) = newX;
        y1(idx) = newY;
    %     fprintf('coords are: %d %d\n', newX, newY);
    end
    

     for idx = 1:length(x1)
        X(idx) = x1(idx);
        Y(idx) = y1(idx);
    %     fprintf('coords are: %d %d\n', newX, newY);
    end
    
       [Y,index]=sort(Y,'descend');   
       X=X(index); 
end
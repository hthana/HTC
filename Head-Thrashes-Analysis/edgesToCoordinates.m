function [xCoordinates,yCoordinates]=edgesToCoordinates(img)

xCoordinates=[];
yCoordinates=[];

xLength=length(img(1,1:end));
yLength=length(img(1:end,1));

% for i=1:xLength
%     img(1:end,i)=flipud(img(1:end,i));
% end

for x=1:xLength
    for y=1:yLength
        if img(y,x)
            xCoordinates=[xCoordinates x];
            yCoordinates=[yCoordinates y];
        end
    end
end


yCoordinates=yLength-yCoordinates+1;
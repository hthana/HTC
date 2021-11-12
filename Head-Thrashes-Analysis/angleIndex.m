function [ outputArray ] = angleIndex( angleArray )
%Takes angleArray, finds max displacement and then divides each angle by
%max to get ratio of max displacement: -1 to 1 

%   Detailed explanation goes here
max = 0;
for i = 1:length(angleArray)
    if abs(angleArray(i)) > max
        max = abs(angleArray(i));
    end 
end
fprintf('Max angle is %d\n', max);

for j = 1:length(angleArray)
    outputArray(j) = (angleArray(j)/max);
%     outputArray(j) = angleArray(j);
end
    
 

end


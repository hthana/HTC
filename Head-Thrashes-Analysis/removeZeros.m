function out=removeZeros(in)
out=[];
for i=1:length(in)
    if in(i)~=0 
        out=[out in(i)];
    end
end
function [x1,y1,x2,y2]=splitLines(xSeq,ySeq,headPt,tailPt)

x1=[];
y1=[];
x2=[];
y2=[];
%move in positive direction
i1=headPt;
while i1~=tailPt+1
    if i1==length(xSeq)+1
        i1=1;
    end
    x1=[x1 xSeq(i1)];
    y1=[y1 ySeq(i1)];
    i1=i1+1;
end

%move in the negative direction 
i2=headPt;
while i2~=tailPt-1
    if i2==0
        i2=length(xSeq);
    end
    x2=[x2 xSeq(i2)];
    y2=[y2 ySeq(i2)];
    i2=i2-1;
end

disp('Lines split successfully');
function [ headangle ] = headBendAngle( x , y )

a2 = (x(1)-x(2))*(x(1)-x(2))+(y(1)-y(2))*(y(1)-y(2));
b2 = (x(3)-x(2))*(x(3)-x(2))+(y(3)-y(2))*(y(3)-y(2));
c2 = (x(1)-x(3))*(x(1)-x(3))+(y(1)-y(3))*(y(1)-y(3));
% % 

a = sqrt(a2);
b = sqrt(b2);
c = sqrt(c2);
pos = (a2+b2-c2)/(2*a*b);   
angle = acos(pos);        
realangle = angle*180/pi;   
% disp(realangle)
headangle = 180 - realangle;


headangle=roundn(headangle,-2);

if headangle > 90
    headangle = 90;
end

end


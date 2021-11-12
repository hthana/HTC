function curvatureCheck(mX,mY)
%bends=wormBends2(mX,mY,2:12);
bends=wormBends2(mX,mY,2:8);
% f=figure;
% plot(bends)

if max(abs(bends))>120
    disp(bends)
    disp('Invalid worm spline curvature; Retrying.')
    guihgka
end
% delete(f)
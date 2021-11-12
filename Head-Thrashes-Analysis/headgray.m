function [  ] = headgray( headx,heady,tailx,taily )

img = imread('gray_image\1.tif');
grayimg = rgb2gray(img);
disp(['The gray value of the head is  ' num2str(grayimg(headx,heady))]);
disp(['The gray value of the tail is  ' num2str(grayimg(tailx,taily))]);

figure;
imshow(grayimg);
hold on;
headgray = grayimg(headx,heady);
tailgray = grayimg(tailx,taily);

if headgray >= tailgray
    plot(headx,heady,'cx','MarkerSize',12,'LineWidth',2 ,'color','r');
else
    plot(tailx,taily,'cx','MarkerSize',12,'LineWidth',2 ,'color','r');
end

end


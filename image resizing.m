A = imread('cameraman.tif');
y = imresize(A, 1/2);
imshow(y);
figure, imagesc(y)
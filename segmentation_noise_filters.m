%% Read in an image
A = imread("toys_candy.jpg");
imshow(A);
%% convert to grayscale image
Agray = rgb2gray(A); figure;
imshow(Agray);

%% image segmentation - using roicolor with
%  grayscale image generated above
BW = roicolor(Agray, 110, 255);
figure; imshow(BW);

%% image segmentation - by converting to Black and white
level=0.5;
Athresh = imbinarize(Agray, level);
figure; imshowpair(A, Athresh, 'montage');

%% complement the segemented image 
Acomp = imcomplement(BW);
Acomplement = imcomplement(Athresh);
figure, 
subplot(2,2, [1,2]), imshow(A); title("Original image");
subplot(2,2,3), imshow(Acomp); title('Complement of BW');
subplot(2,2,4), imshow(Acomplement); title('Complemenet of Athresh');

%% Fill the holes
Afilled=imfill(Acomp, 'holes');
figure, imshow(Afilled);


% Second Tutorial
%% reading, changing format and writing to local storage
image = imread("assembly.jpg");
imwrite(image, 'assemblyPNG.png', 'png');



%% Min and Max filters
O = imread('cameraman.jpg');
Og = rgb2gray(O);
figure;
subplot(2,2,1), imshow(O); title("Original image");
subplot(2,2,2), imshow(Og); title("BW image");

minf = @(x) min(x(:));  % set min filter
maxf = @(x) max(x(:));   % set max filter

min_image = nlfilter(Og, [3, 3], minf);  % Apply over 3x3 neighbourhood
max_image = nlfilter(Og, [3, 3], maxf);

subplot(2, 2, 3), imshow(min_image), title("Min image");
subplot(2, 2, 4), imshow(max_image), title("Max image");

%% Adding Salt and Paper Noise
A = imread('kitten.jpg');
N = imnoise(A, 'salt & pepper', 0.05);

subplot(1,2,1), imshow(A), title("Original imaage");
subplot(1,2,2), imshow(N), title("Noisy imaage");


%% Removing Salt and Paper Noise
A = imread('kitten.jpg');
N = imnoise(A, 'salt & pepper', 0.05);

mf = ones(3,3)/9;  % a convolutional filter

D = imfilter(N, mf);

subplot(2,2,1), imshow(A), title("Original imaage");
subplot(2,2,2), imshow(N), title("Noisy imaage");
subplot(2,2,[3,4]), imshow(D), title("Denoised imaage");

%% Using Median filter to remove salt and paper noise
A = imread('kitten.jpg');
N = imnoise(A, 'salt & pepper', 0.05);

  % separate the three channels of the RGB image
  R = N(:,:,1); G=N(:,:,2); B=N(:,:,3);
  
  % applying the median filter to all three channels
  R = medfilt2(R, [3,3]);
  G = medfilt2(G, [3,3]);
  B = medfilt2(B, [3,3]);
  
  % concatenating the 3 channels
  
  D = cat(3, R, G, B);

subplot(3,3,1), imshow(A), title("Original image");
subplot(3,3,3), imshow(N), title("Noisy image");

subplot(3,3,4), imshow(R), title("Red Channel");
subplot(3,3,5), imshow(G), title("Green Channel");
subplot(3,3,6), imshow(B), title("Blue Channel");

subplot(3,3,8), imshow(D), title("Denoised imaage");

%% Gaussian Filter
A = imread('kitten.jpg');
N = imnoise(A, 'salt & pepper', 0.05);
N2 = imnoise(A, 'gaussian', 0.05);

 % separate the three channels of the RGB image
  R = N(:,:,1); G=N(:,:,2); B=N(:,:,3);
  
 % define the filter
 filter = fspecial('gaussian', [10, 10], 4);
 
 R = imfilter(R, filter);
 G = imfilter(G, filter);
 B = imfilter(B, filter);

D = cat(3, R, G, B);

subplot(2,2,1), imshow(A), title("Original image");
subplot(2,2,2), imshow(N), title("Noisy image");

subplot(2,2,[3,4]), imshow(D), title("Denoised imaage");





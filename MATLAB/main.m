
function main
%% read the image
inputimg = imread('peppers.bmp');
%inputimg = imread('Lena.bmp');

X = double(inputimg);
%[a,b] = size(X);
Y= blkproc(X,[8 8],'dct2');
X1 = blkproc(Y,[8 8],'idct2');

figure
subplot(1,3,1);
imshow(uint8(X));
title('The original image');

subplot(1,3,2);
imshow(uint8(Y));
title('DCT Transform');

subplot(1,3,3);
imshow(uint8(X1));
title('block DCT Transform recovery');

% The compression matrix
x = [1,3,5,10,20];

%% Compress with the ratio = 1
tic
    [encode,tables] = JPEG_ENCODE(inputimg,1);
    outputimg = JPEG_DECODE(encode,tables,1);

    % Calculate the PSNR
    y(1) = psnr(inputimg,outputimg);
    PSNR_1 = y(1)

    %Calculate the Image Compression rate
    temp = size(encode,1) * size(encode,2);
    temp2 = size(inputimg,1) * size(inputimg,2);
    z(1) = ((temp2 - temp) / temp2) * 100;
    CompressionRate_1 = z(1)

    %Show the result
    figure,subplot(1,2,1),imshow(inputimg);
    title('The original image');
    subplot(1,2,2),imshow(outputimg);
    title('N = 1');
    disp('N = 1');
    whos inputimg encode outputimg tables
toc

% Predict block with DPCM prediction
tic
    QP=1;
    error = DPCM_encoder(X, QP);
    reconstructed_1 = DPCM_decoder(error);

    % Display result of compressed image
    figure,subplot(1,2,1),imshow(outputimg);
    title('the compressed image');
    subplot(1,2,2), imshow(reconstructed_1,[]); 
    title('Reconstruction images QP=1');
toc

%% Compress with the ratio = 3
tic
    [encode,tables] = JPEG_ENCODE(inputimg,3);
    outputimg = JPEG_DECODE(encode,tables,3);

    %Calculate the PSNR
    y(2) = psnr(inputimg,outputimg);
    PSNR_3 = y(2)

    %Calculate the Image Compression rate
    temp = size(encode,1) * size(encode,2);
    temp2 = size(inputimg,1) * size(inputimg,2);
    z(2) = ((temp2 - temp) / temp2) * 100;
    CompressionRate_3 = z(2)

    %Show the result
    figure,subplot(1,2,1),imshow(inputimg);
    title('The original image');
    subplot(1,2,2),imshow(outputimg);
    title('N = 3');
    disp('N = 3');
    whos inputimg encode outputimg tables
toc

% Predict block with DPCM prediction
tic
    QP=3;
    error = DPCM_encoder(X, QP);
    reconstructed_3 = DPCM_decoder(error);

    % Display result of compressed image
    figure,subplot(1,2,1),imshow(outputimg);
    title('the compressed image');
    subplot(1,2,2), imshow(reconstructed_3,[]); 
    title('Reconstruction images QP=3');
toc

%% Compress with the ratio = 5
tic
    [encode,tables] = JPEG_ENCODE(inputimg,5);
    outputimg = JPEG_DECODE(encode,tables,5);

    %Calculate the PSNR
    y(3) = psnr(inputimg,outputimg);
    PSNR_5 = y(3)

    %Calculate the Image Compression rate
    temp = size(encode,1) * size(encode,2);
    temp2 = size(inputimg,1) * size(inputimg,2);
    z(3) = ((temp2 - temp) / temp2) * 100;
    CompressionRate_5 = z(3)

    %Show the result
    figure,subplot(1,2,1),imshow(inputimg);
    title('The original image');
    subplot(1,2,2),imshow(outputimg);
    title('N = 5');
    disp('N = 5');
    whos inputimg encode outputimg tables
toc

% Predict block with DPCM prediction
tic
    QP=5;
    error = DPCM_encoder(X, QP);
    reconstructed_5 = DPCM_decoder(error);

    % Display result of compressed image
    figure,subplot(1,2,1),imshow(outputimg);
    title('the compressed image');
    subplot(1,2,2), imshow(reconstructed_5,[]); 
    title('Reconstruction images QP=5');
toc

%% Compress with the ratio = 10
tic
    [encode,tables] = JPEG_ENCODE(inputimg,10);
    outputimg = JPEG_DECODE(encode,tables,10);

    %Calculate the PSNR
    y(4) = psnr(inputimg,outputimg);
    PSNR_10 = y(4)

    %Calculate the Image Compression rate
    temp = size(encode,1) * size(encode,2);
    temp2 = size(inputimg,1) * size(inputimg,2);
    z(4) = ((temp2 - temp) / temp2) * 100;
    CompressionRate_10 = z(4)

    %Show the result
    figure,subplot(1,2,1),imshow(inputimg);
    title('The original image');
    subplot(1,2,2),imshow(outputimg);
    title('N = 10');
    disp('N = 10');
    whos inputimg encode outputimg tables
toc

% Predict block with DPCM prediction
tic
    QP=10;
    error = DPCM_encoder(X, QP);
    reconstructed_10 = DPCM_decoder(error);

    % Display result of compressed image
    figure,subplot(1,2,1),imshow(outputimg);
    title('the compressed image');
    subplot(1,2,2),imshow(reconstructed_10,[]); 
    title('Reconstruction images QP=10');
toc
%% Compress with the ratio = 20
tic
    [encode,tables] = JPEG_ENCODE(inputimg,20);
    outputimg = JPEG_DECODE(encode,tables,20);

    %Show the result
    figure,subplot(1,2,1),imshow(inputimg);
    title('The original image');
    subplot(1,2,2),imshow(outputimg);
    title('N = 20');
    disp('N = 20');
    whos inputimg encode outputimg tables

    %Calculate the PSNR
    y(5) = psnr(inputimg,outputimg);
    PSNR_20 = y(5)

    %Calculate the Image Compression rate
    temp = size(encode,1) * size(encode,2);
    temp2 = size(inputimg,1) * size(inputimg,2);
    z(5) = ((temp2 - temp) / temp2) * 100;
    CompressionRate_20 = z(5)
toc
% Predict block with DPCM prediction
tic
    QP=20;
    error = DPCM_encoder(X, QP);
    reconstructed_20 = DPCM_decoder(error);

    % Display result of compressed image
    figure,subplot(1,2,1),imshow(outputimg);
    title('the compressed image');
    subplot(1,2,2),imshow(reconstructed_20,[]); 
    title('Reconstruction images QP=20');
toc
%% Draw the PSNR graph
figure,plot(x,y);
title('PSNR graph');

%% Draw the Compression graph
figure,plot(x,z);
title('Compression graph');
end
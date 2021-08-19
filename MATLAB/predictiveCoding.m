%eg:
%The following pair size is512*512Pixels and gray levels are256The standard lena image is subjected to lossless first-order predictive coding, and the matlab program is as follows:
I=imread('peppers.bmp');     
x=double(I);
y=LPCencode(x);   
xx=LPCdecode(y);
% Display forecast error value
figure(1);
subplot(121);
imshow(I);
subplot(122);
imshow(mat2gray(y));
%Calculate the mean square error, because it is a lossless coding, then erms should be 0
e=double(x)-double(xx)
[m, n]=size(e);
erms=sqrt(sum(e(:).^2)/(m*n))    
 %Display original image histogram
figure(2);
subplot(121);
[h f]=hist(x(:));    
bar(f, h, 'k');
% Histogram showing prediction error
subplot(122);
[h f]=hist(y(:));    
bar(f, h,'k');

%Encoder
%The %LPCencode function uses one-dimensional lossless predictive coding to compress the image x, and a is the prediction coefficient. If a defaults, the default a=1, which is the previous value prediction.
function y=LPCencode(x, a)
    error(nargchk(1, 2, nargin));
    if nargin<2
        a=1;
    end
    x=double(x);   
    [m, n]=size(x);
    p=zeros(m, n);  % Store predicted value
    xs=x;   
    zc=zeros(m, 1);
    for i=1:length(a)
        xs=[zc  xs(:, 1:end-1)];    
        p=p+a(i)*xs;
    end
y=x-round(p);
end
%decoder
%The decoding program of the %LPCdecode function uses the same predictor as the encoding program
function x=LPCdecode(y, a)
    error(nargchk(1, 2, nargin));
    if nargin<2
        a=1;
    end
    a=a(end: -1: 1);     
    [m, n]=size(y);     
    order=length(a);
    a=repmat(a, m, 1);      
    x=zeros(m, n+order);
    for i=1:n
        ii=i+order;
        x(:, ii)=y(:, i)+round(sum(a(:, order: -1: 1).*x(:, (ii-1): -1:(ii-order)), 2));
    end
x=x(:, order+1:end );
end
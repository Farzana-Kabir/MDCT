A= imread('img.jpg');
figure,imshow(A);

B= fft2(A);
B=real(B);

C=fftshift(B);
figure
subplot(1,3,1)   
imshow(A);
title('Original Image');

subplot(1,3,2)      
imshow(B);
title('fft2');

subplot(1,3,3)      
imshow(C);           
title('fftshift');

figure,imshow(C);

I = C(:,:,1);
I = im2double(I);
T = dctmtx(8);
B = blkproc(I,[8 8],'P1*x*P2',T,T');
mask = [1   1   1   1   1   0   0   0
        1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1.*x',mask);
I2 = blkproc(B2,[8 8],'P1*x*P2',T',T);

I = C(:,:,2);
I = im2double(I);
T = dctmtx(8);
B = blkproc(I,[8 8],'P1*x*P2',T,T');
mask = [1   1   1   1   1   0   0   0
        1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1.*x',mask);
I3 = blkproc(B2,[8 8],'P1*x*P2',T',T);

 
I = C(:,:,3);
I = im2double(I);
T = dctmtx(8);
B = blkproc(I,[8 8],'P1*x*P2',T,T');
mask = [1   1   1   1   1   0   0   0
        1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1.*x',mask);
I4 = blkproc(B2,[8 8],'P1*x*P2',T',T);

 
L(:,:,:)=cat(3,I2, I3, I4);
L1= ifft2(L);
figure, imshow(L);

L1=real(L1);
figure, imshow(L1);

r = L1(:, :, 1);
g = L1(:, :, 2);
b = L1(:, :, 3);
rd= dct2(r);
gd=dct2(g);
bd = dct2(b);

Final(:,:,:)=cat(3,rd, gd, bd);
figure,imshow(Final);





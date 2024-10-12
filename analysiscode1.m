image1 = imread('d512.jpg');
image2 = imread('k256.jpg');
image3 = imread('jb128.jpg');

mask2 = uint8(bin2dec('11111100'));
mask3 = uint8(bin2dec('11111000'));

masked_image1_2 = bitand(image1, mask2);
masked_image1_3 = bitand(image1, mask3);
masked_image2_2 = bitand(image2, mask2);
masked_image2_3 = bitand(image2, mask3);
masked_image3_2 = bitand(image3, mask2);
masked_image3_3 = bitand(image3, mask3);


psnr1_2 = myPSNR(image1, masked_image1_2);
psnr1_3 = myPSNR(image1, masked_image1_3);

psnr2_2 = myPSNR(image2, masked_image2_2);
psnr2_3 = myPSNR(image2, masked_image2_3);

psnr3_2 = myPSNR(image3, masked_image3_2);
psnr3_3 = myPSNR(image3, masked_image3_3);

disp('512x512 Images:');
disp('---------------------');
disp('Image 1 Information:');
disp(['Size: ' num2str(size(image1))]);
disp(['PSNR (2 bits): ' num2str(psnr1_2)]);
disp(['PSNR (3 bits): ' num2str(psnr1_3)]);
disp(' ');

disp('256x256 Images:');
disp('---------------------');
disp('Image 2 Information:');
disp(['Size: ' num2str(size(image2))]);
disp(['PSNR (2 bits): ' num2str(psnr2_2)]);
disp(['PSNR (3 bits): ' num2str(psnr2_3)]);
disp(' ');

disp('128x128 Images:');
disp('---------------------');
disp('Image 3 Information:');
disp(['Size: ' num2str(size(image3))]);
disp(['PSNR (2 bits): ' num2str(psnr3_2)]);
disp(['PSNR (3 bits): ' num2str(psnr3_3)]);
disp(' ');

function psnr_val = myPSNR(original_image, processed_image)
    original_image = double(original_image);
    processed_image = double(processed_image);
    
    [m,n]=size(original_image);
    mse = immse(original_image,processed_image);
    max_pixel_value = 255;
    psnr_val = 10 * log10((max_pixel_value^2) / mse);
end

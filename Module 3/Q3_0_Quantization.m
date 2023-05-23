%3.0 Quantization function imgq=quan(img,thr,lvl)

load('Q3.mat', 'img');
img = double(img);
% Perform quantization on the image using the function 'quan', 
% with threshold of 127 and levels of 0 and 255
imgq = quan(img, [127], [0, 255]);

% Display the quantized image
figure();
imshow(imgq);
title('Quantized Image');

% Define the quantization function
function imgq = quan(img, thr, lvl)
    % Initialize an array to store the quantized image
    imgq = zeros(size(img), 'uint8');
    for i = 1:numel(img) % Iterate through each pixel of the image
        pxl = img(i);
        if pxl <= thr(1)
            pxlq = lvl(1);
        elseif pxl > thr(end)
            pxlq = lvl(end);
        else
            for j = 2:length(thr)
                if thr(j-1)<pxl && pxl <= thr(j)
                    pxlq = lvl(j);
                    break;
                end
            end
        end
        % Store the quantized value in the output array
        imgq(i) = pxlq;
    end
end

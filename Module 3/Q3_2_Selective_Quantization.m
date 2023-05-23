%3.2 Selective Quantization

load('Q3.mat', 'img');

% Selective quantization
thr = prctile(img(:), [0, 12.5, 25, 37.5, 50, 62.5, 75, 87.5,100]); % Find the percentiles of the image
lvl = thr(1:end-1) + diff(thr)/2; % Choose the center of each interval as the quantized value % Use the percentiles as the quantized values
thr = thr(2:end-1);
imgq2 = quan(img, thr, lvl); % Quantize the image using the selective quantization rule
imshow(imgq2);

% Display the quantization thresholds and levels
thr1 = thr(1); thr2 = thr(2); thr3 = thr(3); thr4 = thr(4); thr5 = thr(5); thr6 = thr(6); thr7 = thr(7);
lvl1 = lvl(1); lvl2 = lvl(2); lvl3 = lvl(3); lvl4 = lvl(4); lvl5 = lvl(5); lvl6 = lvl(6); lvl7 = lvl(7); lvl8 = lvl(8);

% Calculate the MSE of the quantization
n = numel(img);
MSE = sum((double(img(:))-double(imgq2(:))).^2) / n;

function imgq = quan(img, thr, lvl)

imgq = zeros(size(img), 'uint8');
for i = 1:numel(img)
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
    imgq(i) = pxlq;
end
end
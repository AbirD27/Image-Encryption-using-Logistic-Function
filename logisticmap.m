function [RandIm]=logisticmap(a, x0, inputImage)
    if ndims(inputImage) == 3
        inputImage = rgb2gray(inputImage);
    end

    [rows, cols] = size(inputImage);
    total = rows * cols;

    x = zeros(1, total); 
    x(1) = x0;

    for i = 2:total
        x(i) = a * x(i-1) * (1 - x(i-1));
    end

    transformed = reshape(uint8(x * 255), rows, cols);
    RandIm=transformed;
    
end

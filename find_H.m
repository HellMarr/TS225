function [H,coo_dest] = find_H(img_dest,img_src)
    H = ones(3);
    %Prise des points en zigzag
    figure,
    imagesc(uint8(img_src));
    title("Image source");
    [X2,Y2] = ginput(4);
    coo2 = [X2 Y2];
    close;
    
    figure,
    imagesc(uint8(img_dest));
    title("Image destination");
    [X1,Y1] = ginput(4);
    coo1 = [X1 Y1];
    coo_dest = floor(coo1);
    close;
    
    A = zeros(8);
    B = zeros(8,1);
    
    for i=1:2:8
        B(i:i+1) = coo2(ceil(i/2),:); 
    end
    
    for i=1:4
        A(2*i-1,1) = coo1(i,1);
        A(2*i-1,2) = coo1(i,2);
        A(2*i-1,3) = 1;
        A(2*i-1,7) = -coo1(i,1)*coo2(i,1);
        A(2*i-1,8) = -coo1(i,2)*coo2(i,1);
    end
    for i=1:4
        A(2*i,4) = coo1(i,1);
        A(2*i,5) = coo1(i,2);
        A(2*i,6) = 1;
        A(2*i,7) = -coo1(i,1)*coo2(i,2);
        A(2*i,8) = -coo1(i,2)*coo2(i,2);
    end
    
    X = A\B;
    H(1,:) = X(1:3);
    H(2,:) = X(4:6);
    H(3,1:2) = X(7:8);
end
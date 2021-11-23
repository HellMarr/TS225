function [coo2,H] = find_H(img1,img2)
    [h1,w1,z1] = size(img1);
    [h2,w2,z2] = size(img2);
    H = ones(3);
    coo1 = zeros(4,2);
    coo2 = zeros(4,2);
    coo2(1,:) = [1 1];
    coo2(2,:) = [1 w2];
    coo2(3,:) = [h2 1];
    coo2(4,:) = [h2 w2];
    
    imagesc(uint8(img1));
    [X1,Y1] = ginput(4);
    coo1 = [X1 Y1];
    
%     imagesc(img2);
%     for i=1:4
%         [coo2(i,1),coo2(i,2)] = ginput(1);
%     end
    
    A = zeros(8);
    B = zeros(8,1);
    
    ind = 1;
    for i=1:4
        for j=1:2
            B(ind) = coo2(i,j);
            ind = ind + 1;
        end
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
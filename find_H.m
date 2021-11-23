function H = find_H(img1,img2)
    H = ones(3);
    coo1 = zeros(4,2);
    coo2 = zeros(4,2);
    
    imagesc(img1);
    for i=1:4
        [coo1(i,1),coo1(i,2)] = ginput(1);
    end
    
    imagesc(img2);
    for i=1:4
        [coo2(i,1),coo2(i,2)] = ginput(1);
    end
    
end
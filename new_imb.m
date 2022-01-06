function triplet = new_imb(triplet1,img2,flag,H12,coo)
    triplet = struct('img',[],'mask',[],'boite',[]);
    img1 = triplet1.img;
    mask1 = triplet1.mask;
    boite1 = triplet1.boite;
    [h1,w1,z1] = size(img1);
    
    if flag
        [H,coo2] = find_H(img1,img2);
    else
        coo2 = coo;
        H = H12;
    end
    boite = find_new_boite(H,boite1);
    mask = zeros(boite(2,2)-boite(1,2)+1,boite(2,1)-boite(1,1)+1);
    img = zeros(boite(2,2)-boite(1,2)+1,boite(2,1)-boite(1,1)+1,3);
    H_inv = inv(H);
    [h,w,z] = size(img);
    for i=1:w     %x
        for j=1:h     %y
            [x,y] = homographie(H_inv,boite(1,1)+i-1,boite(1,2)+j-1);
            if x >= 1 && x <= w1 && y >= 1 && y <= h1
                img(j,i,:) = img1(y,x,:);
                mask(j,i) = mask1(y,x);
            end
        end
    end
    triplet.img = img;
    triplet.mask = mask;
    triplet.boite = boite;
    figure;
    imagesc(uint8(img))
end


function [img,mask,boite] = new_imb(img1,mask1,boite1,img2,flag,H12,coo)
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
    [h,w,z] = size(img);
    for i=1:w     %x
        for j=1:h     %y
            [x,y] = homographie(inv(H),i,j);
            if x >= 1 && x <= w1 && y >= 1 && y <= h1
                img(j,i,:) = img1(y-boite(1,2),x -boite(1,1),:);
                mask(j,i) = 1;
            end
        end
    end
    figure;
    imagesc(uint8(img))
end


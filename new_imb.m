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
    for i=1:w1
        for j=1:h1
            [x,y] = homographie(inv(H),i,j);
            disp(y);
            %if x >= boite(1,1) && x <= boite(2,1) && y >= boite(1,2) && y <= boite(2,2)
                img(y-boite(1,2)+1,x-boite(1,1)+1,:) = img1(j,i,:);
                mask(y-boite(1,2)+1,x-boite(1,1)+1) = 1;
            %end
        end
    end
    figure;
    imagesc(uint8(img))
end


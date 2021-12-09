function [img,mask,boite] = etape_2(img1,mask1,boite1,img2,mask2,boite2)
%ETAPE_2 Summary of this function goes here
%   Detailed explanation goes here
    [h1,w1,z1] = size(img1);
    [h2,w2,z2] = size(img2);
    [H,coo2] = find_H(img1,img2);
    coord= [1,1;w1,1;1,h1;w1,h1];
    for i=1:4
        [x(i),y(i)] = homographie(H,coord(i,1),coord(i,2));
    end
    max_x = max(x);
    max_y = max(y);
    min_x = min(x);
    min_y = min(y);
    boite = [min_x,max_x;min_y,max_y];
    mask = zeros(max_x-min_x+1,max_y-min_y+1);
    img = zeros(max_x-min_x+1,max_y-min_y+1,3);
    for i=1:h1
        for j=1:w1
            [x,y] = homographie(H,j,i);
            %if x > 0 && x <= h2 && y > 0 && y <= w2
                img(x-min_x+1,y-min_y+1,:) = img1(i,j,:);
            %end
        end
    end
    
    
end


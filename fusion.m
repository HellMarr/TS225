function triplet_f = fusion(triplet1,triplet2,varargin)
    triplet_f = struct('img',[],'mask',[],'boite',[]);
    
    %Pour mosaïque à plus de 2 images
    min_x = NaN;
    min_y = NaN;
    max_x = NaN;
    max_y = NaN;
    if nargin > 2
        for k=1:nargin-2
            min_x = min(min_x,varargin{k}.boite(1,1));
            min_y = min(min_y,varargin{k}.boite(1,2));
            max_x = max(max_x,varargin{k}.boite(2,1));
            max_y = max(max_y,varargin{k}.boite(2,2));
        end
    end
    
    img1 = triplet1.img;
    mask1 = triplet1.mask;
    boite1 = triplet1.boite;
    
    img2 = triplet2.img;
    mask2 = triplet2.mask;
    boite2 = triplet2.boite;
    
    x_min = min([boite1(1,1),boite2(1,1),min_x]);
    x_max = max([boite1(2,1),boite2(2,1),min_y]);
    y_min = min([boite1(1,2),boite2(1,2),max_y]);
    y_max = max([boite1(2,2),boite2(2,2),max_y]);
    
    boite_f = [x_min y_min; x_max y_max];
    mask_f = zeros(y_max-y_min+1,x_max-x_min+1);
    img_f = zeros(y_max-y_min+1,x_max-x_min+1,3);
    [h,w,z] = size(img_f);
    
    img_f(boite1(1,2)-y_min+1:boite1(2,2)-y_min+1,boite1(1,1)-x_min+1:boite1(2,1)-x_min+1,:)=img1;
    %Addition pour la partie commune
    img_f(boite2(1,2)-y_min+1:boite2(2,2)-y_min+1,boite2(1,1)-x_min+1:boite2(2,1)-x_min+1,:)= ...
    img_f(boite2(1,2)-y_min+1:boite2(2,2)-y_min+1,boite2(1,1)-x_min+1:boite2(2,1)-x_min+1,:)+img2;
    
    mask_f(boite1(1,2)-y_min+1:boite1(2,2)-y_min+1,boite1(1,1)-x_min+1:boite1(2,1)-x_min+1)=mask1;
    %Addition pour la partie commune
    mask_f(boite2(1,2)-y_min+1:boite2(2,2)-y_min+1,boite2(1,1)-x_min+1:boite2(2,1)-x_min+1)= ...
    mask_f(boite2(1,2)-y_min+1:boite2(2,2)-y_min+1,boite2(1,1)-x_min+1:boite2(2,1)-x_min+1)+mask2;

    %Pour mosaïque à plus de 2 images
    if nargin > 2
        for k=1:nargin-2
            img = varargin{k}.img;
            mask = varargin{k}.mask;
            boite = varargin{k}.boite;
            %Addition pour la partie commune
            img_f(boite(1,2)-y_min+1:boite(2,2)-y_min+1,boite(1,1)-x_min+1:boite(2,1)-x_min+1,:)= ...
            img_f(boite(1,2)-y_min+1:boite(2,2)-y_min+1,boite(1,1)-x_min+1:boite(2,1)-x_min+1,:)+img;
            %Addition pour la partie commune
            mask_f(boite(1,2)-y_min+1:boite(2,2)-y_min+1,boite(1,1)-x_min+1:boite(2,1)-x_min+1)= ...
            mask_f(boite(1,2)-y_min+1:boite(2,2)-y_min+1,boite(1,1)-x_min+1:boite(2,1)-x_min+1)+mask;
        end
    end
 
    %Utilisation du mask final
    for i=1:h
        for j=1:w
            if mask_f(i,j) ~= 0
                img_f(i,j,:) = floor(img_f(i,j,:)/mask_f(i,j));
            end
        end
    end
    triplet_f.boite = boite_f;
    triplet_f.mask = mask_f;
    triplet_f.img = img_f;
end


function new_triplet = non_commun(triplet_dest,triplet,varargin)
    if nargin == 2
        return;
    end
    
    %varargin est ici tous les triplets et donc tous les espaces par
    %lesquels il faut passer pour passer l'image de triplet dans l'espace
    %de l'image de triplet_dest
    
    img_dest = triplet_dest.img;
    img = triplet.img;
    H_final = eye(3);
    for k=1:nargin-2
       img_tmp = varargin{k}.img;
       H = find_H(img,img_tmp);
       H_final = H_final*H;
       img = img_tmp;
    end
    H = find_H(img,img_dest);
    H_final = H_final*H;
    new_triplet = new_imb(triplet,H_final);
end
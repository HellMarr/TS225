function varargout = commun(triplet_dest,varargin)
    if nargin == 1
        return;
    end
    
    img_dest = triplet_dest.img;
    varargout = varargin;
    for k=1:nargin-1
        triplet = varargin{k};
        H = find_H(triplet.img,img_dest);
        close all;
        varargout{k} = new_imb(triplet,H);
    end
end
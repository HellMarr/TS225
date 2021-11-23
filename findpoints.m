function [haut,bas,gauche,droite] = findpoints(points)
%FINDPOINTS Summary of this function goes here
%   Detailed explanation goes here
    pointhautgauche = zeros(1,2);
    pointhautdroite = zeros(1,2);
    pointbasdroite = zeros(1,2);
    pointbasgauche = zeros(1,2);

    pointhaut = points(1,2);
    pointgauche = points(1,1);
    pointbas = points(1,2);
    pointdroite = points(1,1);
    
    haut = points(1,2);
    gauche = points(1,1);
    bas = points(1,2);
    droite = points(1,1);

    for k=1:4
       if points(k,1) > points(pointbas,1) || bas == 0
           pointbas = k;
           bas = points(k,1);
       end
       if points(k,2) < points(pointgauche,2) || gauche == 0
           pointgauche = k;
           gauche = points(k,2);
       end
       if points(k,1) < points(pointhaut,1) || haut == 0
           pointhaut = k;
           haut = points(k,1);
       end
       if points(k,2) > points(pointdroite,2) || droite == 0
           pointdroite = k;
           droite = points(k,2);
       end
    end

end


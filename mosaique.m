H = zeros(3,3);
H(3,3) = 1;
%points = zeros(4,2);
points = [1,2 ; 2,3 ; 3,4 ; 5,1];
disp(points)
[haut,bas,gauche,droite] = findpoints(points);

for k = haut:bas
    for j = gauche:droite
        %on modifie ces pixels là
    end
end
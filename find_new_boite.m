function new_boite = find_new_boite(H,boite)
    coord= [boite(1,:);boite(1,1),boite(2,1);boite(2,2),boite(1,2);boite(2,:)];
    for i=1:4
        [x(i),y(i)] = homographie(H,coord(i,1),coord(i,2));
    end
    max_x = max(x);
    max_y = max(y);
    min_x = min(x);
    min_y = min(y);
    new_boite = [min_x,min_y;max_x,max_y];
end
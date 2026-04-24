// Inherit the parent event
event_inherited();

dir = point_direction(x, y, obj_player.x, obj_player.y);
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

x += hspd;
y += vspd;

cd+=1;




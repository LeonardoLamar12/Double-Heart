//Da target no player
dir = point_direction(x, y, obj_player.x, obj_player.y);
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

#region Colisões
//Horizontal
if (!place_meeting(x + hspd, y, obj_col)) {
    x += hspd;
} else {
    hspd = 0;
}

//Vertical
if (!place_meeting(x, y + vspd, obj_col)) {
    y += vspd;
} else {
    vspd = 0;
}
#endregion

image_blend=c_white;

//Faz tomar dano
if distance_to_object(obj_tiro)<1 and cd>20{
	//Dano especifico do fogo azul
	if global.formato=7{
	screen_shake(7, 20);
	image_blend=c_red;
	vida-=2;
	cd=0;
	}
	//Dano normal
	else{
	screen_shake(5, 20);
	image_blend=c_red;
	vida-=1;
	cd=0;
	}
}

//MORRE!!!
if vida<=0{
	instance_destroy(self);
}

//Toma slow
if distance_to_object(obj_slow)<1{
	spd=max_spd/2
}else{spd=max_spd}

//Flipa com o player
if obj_player.x<x{
	image_xscale = 1;
}else{
	image_xscale = -1;
}

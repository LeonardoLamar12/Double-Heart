image_blend=c_white

if distance_to_object(obj_tiro)<1{
	instance_destroy(obj_tiro)
	image_blend=c_black
	vida-=1;
}

if distance_to_object(obj_player)<1{
	global.vida-=2;
}

if vida<=0{
	instance_destroy(self);
}

cdBoss+=1;

if cdBoss>0 and cdBoss<100{
	if cdBoss mod 20=0{
	explosion_particles(x, y, c_green);
	var shot = instance_create_layer(x,y,"tiros",obj_tiro2);
	shot.speed = 16;
	shot.direction = point_direction(x,y,obj_player.x,obj_player.y);
	}
}

if cdBoss>200{
	instance_create_layer(x,y,"Instances",obj_evil1);
	cdBoss=0
}



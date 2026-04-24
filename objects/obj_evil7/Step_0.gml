// Inherit the parent event
event_inherited();

cd+=1;

tempo_gasolina+=1;

if tempo_gasolina>70{
	explosion_particles(x, y, c_aqua);
	var shot = instance_create_layer(x,y,"tiros",obj_tiro2);
	shot.speed = 16;
	shot.direction = point_direction(x,y,obj_player.x,obj_player.y);
	tempo_gasolina=0;
}





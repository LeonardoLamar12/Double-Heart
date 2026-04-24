//Faz ganhar vida com o tiro de vampiro
if global.essencia=2 and global.vidaP<6{
	global.vidaP+=1;
}

//Faz o tiro de zumbi "explodir"
if global.essencia=4{
	if global.formato=0{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 12;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}else if global.formato=1{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 20;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=3.5
	}else if global.formato=2{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		var shot2 = instance_create_layer(x,y,"tiros",obj_tiro);
		var shot3 = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 15;
		shot2.speed = 15;
		shot3.speed = 15;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		shot2.direction = point_direction(x,y,obj_evil.x,obj_evil.y)+10;
		shot3.direction = point_direction(x,y,obj_evil.x,obj_evil.y)-10;
		cd=25
	}else if global.formato=3{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 15;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}else if global.formato=4{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 10;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}else if global.formato=5{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 10;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}else if global.formato=6{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 25;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}else if global.formato=7{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
		shot.speed = 15;
		shot.direction = point_direction(x,y,obj_evil.x,obj_evil.y);
		cd=25
	}
}

//Muda as variaveis de dificuldade e de quantidade de inimigos
global.qtdInimigos-=1
global.dif+=1;

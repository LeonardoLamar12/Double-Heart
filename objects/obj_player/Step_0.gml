//Cria e atribui as variaveis para o teclado 
var right = keyboard_check(ord("D"));
var left = keyboard_check(ord("A"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var tiro = mouse_check_button_pressed(mb_left);
global.esse = keyboard_check_pressed(ord("Q"));
global.forma = keyboard_check_pressed(ord("E"));

#region Movimentação
//Buff de essencia
if global.essencia=7{max_spd=16}else{max_spd=14}

//Faz o input da movimentação
if(right || left || up || down){
	move_dir = point_direction(0,0,(right-left),(down-up));
	spd=lerp(spd,max_spd,0.2);
}else{
	spd=lerp(spd,0,0.2);
}

hspd = lengthdir_x(spd, move_dir);
vspd = lengthdir_y(spd, move_dir);

//flipa personagem com o mouse
if obj_player.x>mouse_x{ image_xscale = 1; }
if obj_player.x<mouse_x{ image_xscale = -1; }
#endregion

#region Dano
//Efeito quando toma dano
image_blend = c_white;
dmg_cd = lerp(dmg_cd, 0, 0.2);
if dmg_cd > 18 {
    image_blend = c_red;
}

//Limita o max de vc
if global.vidaP > 6 {
    global.vidaP = 6;
}

//Faz tomar dano
if distance_to_object(obj_evil) < 1 and dmg_cd <= 0 {
	if global.essencia=6{
		global.vidaP -= 1;
		dmg_cd = 180;
		screen_shake(2, 10);
	}else{
		global.vidaP -= 1;
		dmg_cd = 100;
		screen_shake(3, 10);
	}

    if global.vidaP <= 0 {
        room_goto(roomMenu);
		instance_destroy(self);
        exit;
    }
}

#endregion

#region Essencia

if keyboard_check(ord("R")) and global.esse{
	global.essencia=0
}

if keyboard_check(ord("R")) and global.forma{
	global.formato=0
}

#endregion

#region Tiro
//Faz o "cooldown"
cd=lerp(cd,0,0.5);

//Configura o tiro de acordo com a essencia
if(tiro) and cd<=0 and global.formato=0{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 12;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}else if (tiro) and cd<=0 and global.formato=1{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 20;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=3.5
}else if (tiro) and cd<=0 and global.formato=2{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	var shot2 = instance_create_layer(x,y,"tiros",obj_tiro);
	var shot3 = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 15;
	shot2.speed = 15;
	shot3.speed = 15;
	shot.direction = point_direction(x,y,mouse_x,mouse_y)
	shot2.direction = point_direction(x,y,mouse_x,mouse_y)+10;
	shot3.direction = point_direction(x,y,mouse_x,mouse_y)-10;
	cd=25
}else if (tiro) and cd<=0 and global.formato=3{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 15;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}else if (tiro) and cd<=0 and global.formato=4{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 10;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}else if (tiro) and cd<=0 and global.formato=5{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 10;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}else if (tiro) and cd<=0 and global.formato=6{
	var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 25;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}else if (tiro) and cd<=0 and global.formato=7{
		var shot = instance_create_layer(x,y,"tiros",obj_tiro);
	shot.speed = 15;
	shot.direction = point_direction(x,y,mouse_x,mouse_y);
	cd=25
}

#endregion

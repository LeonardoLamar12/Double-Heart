if keyboard_check_pressed(vk_enter){
	room_goto(choose(Room_1,Room_2,Room_3));
}
if keyboard_check_pressed(vk_escape){
	game_end();
}

if object_exists(obj_player){instance_destroy(obj_player);}

global.qtdInimigos=0;
global.i=0;
global.dif=0;
if global.qtdInimigos <= 0{
    // tá no menu
    ativo = true;
    image_alpha = 1;
} else {
    ativo = false;
    image_alpha = 0;
}

if room == roomMenu {
	image_alpha = 0;
}



if ativo and distance_to_object(obj_player) < 1 and keyboard_check_pressed(ord("F")) {
    if global.dif>3{
		room_goto(choose(Room_4,Room_5,Room_6,Room_7))
		global.dif+=1;
		global.i=0;
	}else{
		room_goto(choose(Room_1,Room_2,Room_3))
		global.dif+=1;
		global.i=0;
	}
	
	if global.dif>=9{
		room_goto(Room_8);
	}
}
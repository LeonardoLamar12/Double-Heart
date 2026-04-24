//Spawna inimigo durante o jogo conforme a dificuldade
while global.i<global.dif{
	var r = irandom_range(1,6);
	if r==1{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil1)
	}else if r==2{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil2)
	}else if r==3{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil3)	
	}else if r==4{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil4)	
	}else if r==5{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil5)	
	}else{
		instance_create_layer(choose(290,1160),200,"Instances",obj_evil6)	
	}
	global.i+=1;
}

//Troca de tela
if keyboard_check_pressed(vk_escape){
	room_goto(roomMenu)
	instance_destroy(obj_player)
	instance_destroy(self)
}
//Faz a colisão com o player 
if distance_to_object(obj_player)<0.1 and global.esse{
	instance_destroy(self);
}
if distance_to_object(obj_player)<0.1 and global.forma{
	instance_destroy(self);
}

//Animação
tempo += 0.05; 
y = base_y + sin(tempo) * 10;
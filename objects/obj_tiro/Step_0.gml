if distance_to_object(obj_evil)<1 and global.formato!=3 and global.essencia!=5{
	instance_destroy(self);
}

if global.formato=4{
	image_xscale+=0.1
	image_yscale+=0.1
}

if global.essencia=0{
	image_blend=c_white;
	global.cor=c_white;
}else if global.essencia=1{
	image_blend=c_green;
	global.cor=c_green;
	if	distance_to_object(obj_evil)<1{
		instance_create_layer(x,y,"tiros",obj_slow)
	}
}else if global.essencia=2{
	image_blend=c_red;
	global.cor=c_red;
}else if global.essencia=3{
	image_blend=c_grey;
	global.cor=c_grey;
}else if global.essencia=4{
	image_blend=c_teal;
	global.cor=c_teal;
}else if global.essencia=5{
	image_blend=c_gray;
	global.cor=c_gray;
}else if global.essencia=6{
	image_blend=c_orange;
	global.cor=c_orange;
}else if global.essencia=7{
	image_blend=c_aqua;
	global.cor=c_aqua;
}

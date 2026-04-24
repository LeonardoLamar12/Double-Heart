draw_set_alpha(0.3)
draw_set_color(c_grey)
draw_circle(680,690,40,0)
draw_circle(800,690,40,0)
draw_set_alpha(1)
draw_set_color(c_white)

if global.essencia=0{
	draw_text(640,690,"");
}else if global.essencia=1{
	draw_sprite(spr_esse1,1,680,690);
}else if global.essencia=2{
	draw_sprite(spr_esse2,1,680,690);
}else if global.essencia=3{
	draw_sprite(spr_esse3,1,680,690);
}else if global.essencia=4{
	draw_sprite(spr_esse4,1,680,690);
}else if global.essencia=5{
	draw_sprite(spr_esse5,1,680,690);
}else if global.essencia=6{
	draw_sprite(spr_esse6,1,680,690);
}else if global.essencia=7{
	draw_sprite(spr_esse7,1,680,690);
}

if global.formato=0{
	draw_text(640,690,"");
}else if global.formato=1{
	draw_sprite(spr_esse1,1,800,690);
}else if global.formato=2{
	draw_sprite(spr_esse2,1,800,690);
}else if global.formato=3{
	draw_sprite(spr_esse3,1,800,690);
}else if global.formato=4{
	draw_sprite(spr_esse4,1,800,690);
}else if global.formato=5{
	draw_sprite(spr_esse5,1,800,690);
}else if global.formato=6{
	draw_sprite(spr_esse6,1,800,690);
}else if global.formato=7{
	draw_sprite(spr_esse7,1,800,690);
}


for (var i = 0; i < 6; i++) {
    draw_sprite(spr_coracaoV, 0, 80 + (i * 32), 55);
}

for (var i = 0; i < global.vidaP; i++) {
    draw_sprite(spr_coracao, 0, 80 + (i * 32), 55);
}

draw_text(1320,80,global.dif)
draw_text(1220,80,global.qtdInimigos)



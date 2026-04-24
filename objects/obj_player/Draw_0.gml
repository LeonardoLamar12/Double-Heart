//Faz a sombra do personagem
draw_set_color(c_black);
draw_set_alpha(0.1);

var shadow_y = y + 40;
draw_ellipse(x-30, shadow_y-5, x+30, shadow_y+15, false);

draw_set_alpha(1);
draw_self();
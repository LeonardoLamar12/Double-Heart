// sombra usa o Y FIXO (base_y)
draw_sprite_ext(sprite_index, image_index, x, base_y+23, 0.8, 0.5, image_angle, c_black, 0.5);

draw_set_alpha(1);
draw_set_color(c_white);

// desenha o objeto de verdade (que sobe/desce)
draw_self();
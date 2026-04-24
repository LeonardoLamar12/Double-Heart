// cria sistema global
global.part_sys = part_system_create();
part_system_depth(global.part_sys, -100);

global.part_explosion = part_type_create();

part_type_shape(global.part_explosion, pt_shape_square);

part_type_size(global.part_explosion, 0.1, 0.2, 0, 0);
part_type_color1(global.part_explosion, c_white);
part_type_alpha2(global.part_explosion, 1, 0);
part_type_life(global.part_explosion, 10, 20);
part_type_speed(global.part_explosion, 2, 5, 0, 0);
part_type_direction(global.part_explosion, 0, 360, 0, 0);
part_type_gravity(global.part_explosion, 0, 270);
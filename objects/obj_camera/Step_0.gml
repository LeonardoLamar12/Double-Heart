// atualizar shake
if (shake_time > 0) {
    shake_time--;
    shake_amount *= 0.9;
} else {
    shake_amount = 0;
}

var cam = view_camera[0];

// posição base (segue o player)
var base_x = target.x - camera_get_view_width(cam) / 2;
var base_y = target.y - camera_get_view_height(cam) / 2;

// shake
var shake_x = random_range(-shake_amount, shake_amount);
var shake_y = random_range(-shake_amount, shake_amount);

// aplica
camera_set_view_pos(cam, base_x + shake_x, base_y + shake_y);
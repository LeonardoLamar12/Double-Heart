i += 1;

if i mod 5 == 0 {
    image_blend = c_black;
} else {
    image_blend = c_white;
}

if i > 60 {
    instance_destroy(self);
} else {
    alarm[0] = 1;
}
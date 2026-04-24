function screen_shake(amount, time) {
    with (obj_camera) {
        shake_amount = max(shake_amount, amount);
        shake_time = max(shake_time, time);
    }
}
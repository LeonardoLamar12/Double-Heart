// --- ESSÊNCIA 2: Chance de cura ao matar um inimigo ---
if global.essencia = 2 and global.vidaP < 6 {
    var i = irandom_range(1, 6); // Sorteia um número entre 1 e 6 (16,6% de chance de curar)
    if i == 1 {
        global.vidaP = global.vidaP + 1; // Ganha 1 ponto de vida
    } else {
        // Sem efeito nos outros resultados (5/6 de chance de não curar)
    }
}

// --- ESSÊNCIA 4: Disparo automático ao matar um inimigo ---
// (código idêntico ao visto anteriormente — mira no inimigo mais próximo)
if global.essencia = 4 {

    // --- FORMATO 0: Tiro único, velocidade média ---
    if global.formato = 0 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 12;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;

    // --- FORMATO 1: Tiro único, velocidade alta, cadência altíssima ---
    } else if global.formato = 1 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 20;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 3.5;

    // --- FORMATO 2: Tiro triplo em leque ---
    } else if global.formato = 2 {
        var shot  = instance_create_layer(x, y, "tiros", obj_tiro); // Central
        var shot2 = instance_create_layer(x, y, "tiros", obj_tiro); // +10°
        var shot3 = instance_create_layer(x, y, "tiros", obj_tiro); // -10°
        shot.speed  = 15;
        shot2.speed = 15;
        shot3.speed = 15;
        shot.direction  = point_direction(x, y, obj_evil.x, obj_evil.y);
        shot2.direction = point_direction(x, y, obj_evil.x, obj_evil.y) + 10;
        shot3.direction = point_direction(x, y, obj_evil.x, obj_evil.y) - 10;
        cd = 25;

    // --- FORMATO 3: Tiro único, velocidade média (penetrante) ---
    } else if global.formato = 3 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 15;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;

    // --- FORMATO 4: Tiro único, velocidade baixa ---
    } else if global.formato = 4 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 10;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;

    // --- FORMATO 5: Igual ao formato 4 ---
    } else if global.formato = 5 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 10;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;

    // --- FORMATO 6: Tiro único, velocidade máxima ---
    } else if global.formato = 6 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 25;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;

    // --- FORMATO 7: Tiro único, velocidade média ---
    } else if global.formato = 7 {
        var shot = instance_create_layer(x, y, "tiros", obj_tiro);
        shot.speed     = 15;
        shot.direction = point_direction(x, y, obj_evil.x, obj_evil.y);
        cd = 25;
    }
}

// Reduz o contador global de inimigos vivos em 1
// Provavelmente usado pelo game manager para saber quando a onda foi concluída
global.qtdInimigos -= 1;
// --- LEITURA DE INPUT ---
var right, left, up, down, tiro;
right = keyboard_check(ord("D"));         // Verifica se D está pressionado (mover direita)
left  = keyboard_check(ord("A"));         // Verifica se A está pressionado (mover esquerda)
up    = keyboard_check(ord("W"));         // Verifica se W está pressionado (mover cima)
down  = keyboard_check(ord("S"));         // Verifica se S está pressionado (mover baixo)
tiro  = mouse_check_button_pressed(mb_left); // Verifica clique esquerdo do mouse (atirar)
global.esse  = keyboard_check_pressed(ord("Q")); // Q pressionado: trocar essência
global.forma = keyboard_check_pressed(ord("E")); // E pressionado: trocar formato

// =====================================================================
#region move
// =====================================================================

// Essência 7 concede velocidade máxima maior que as demais
if global.essencia = 7 { max_spd = 16 } else { max_spd = 14 }

// Se alguma tecla de movimento estiver pressionada
if (right || left || up || down) {
    // Calcula a direção do movimento com base nas teclas pressionadas
    // (right-left) e (down-up) formam um vetor direcional normalizado
    move_dir = point_direction(0, 0, (right - left), (down - up));
    spd = lerp(spd, max_spd, 0.2); // Acelera suavemente até a velocidade máxima
} else {
    spd = lerp(spd, 0, 0.2); // Desacelera suavemente até parar
}

// Converte a velocidade e direção em componentes horizontal e vertical
hspd = lengthdir_x(spd, move_dir);
vspd = lengthdir_y(spd, move_dir);

// Espelha o sprite conforme o lado em que o mouse está em relação ao jogador
if obj_player.x > mouse_x {
    image_xscale = 1;  // Mouse à esquerda: sprite normal
}
if obj_player.x < mouse_x {
    image_xscale = -1; // Mouse à direita: sprite espelhado
}
#endregion

// =====================================================================
#region dmg
// =====================================================================

image_blend = c_white; // Reseta a cor do sprite para branco (sem tingimento)
dmg_cd = lerp(dmg_cd, 0, 0.2); // Reduz o cooldown de dano suavemente a cada frame

// Limita a vida do jogador ao máximo de 6
if global.vidaP > 6 {
    global.vidaP = 6;
}

// Verifica colisão com inimigo corpo a corpo e cooldown zerado
if distance_to_object(obj_evil) < 1 and dmg_cd <= 0 {
    if global.essencia = 6 {
        global.vidaP -= 1;                      // Remove 1 de vida
        dmg_cd = 180 - (global.dif / 2);        // Cooldown maior (essência 6 é mais resistente)
        screen_shake(2, 10);                     // Tremor de tela mais suave
    } else {
        global.vidaP -= 1;
        dmg_cd = 100 - (global.dif / 2);        // Cooldown padrão (reduzido pela dificuldade)
        screen_shake(3, 10);                     // Tremor de tela padrão
    }
}

// Mesma lógica, mas para projéteis inimigos (obj_tiro2)
if distance_to_object(obj_tiro2) < 1 and dmg_cd <= 0 {
    if global.essencia = 6 {
        global.vidaP -= 1;
        dmg_cd = 180 - (global.dif / 2);
        screen_shake(2, 10);
    } else {
        global.vidaP -= 1;
        dmg_cd = 100 - (global.dif / 2);
        screen_shake(3, 10);
    }
}

// Se a vida chegar a zero, vai para o menu e destroi o jogador
if global.vidaP <= 0 {
    room_goto(roomMenu);
    instance_destroy(self);
    exit; // Interrompe a execução do restante do Step Event
}

// Se ainda estiver no período de invencibilidade, tinge o sprite de vermelho
if dmg_cd > 18 {
    image_blend = c_red;
}
#endregion

// =====================================================================
#region essence
// =====================================================================

// Segurar R com Q pressionado reseta a essência para 0 (padrão/neutra)
if keyboard_check(ord("R")) and global.esse {
    global.essencia = 0;
}

// Segurar R com E pressionado reseta o formato para 0 (padrão)
if keyboard_check(ord("R")) and global.forma {
    global.formato = 0;
}
#endregion

// =====================================================================
#region shot
// =====================================================================

cd = lerp(cd, 0, 0.5); // Reduz o cooldown de disparo suavemente a cada frame

// --- FORMATO 0: Tiro único, velocidade média ---
if (tiro) and cd <= 0 and global.formato = 0 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 12;
    shot.direction = point_direction(x, y, mouse_x, mouse_y); // Aponta para o cursor do mouse
    cd = 25;

// --- FORMATO 1: Tiro único, velocidade alta, cadência altíssima (metralhadora) ---
} else if (tiro) and cd <= 0 and global.formato = 1 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 20;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 3.5;

// --- FORMATO 2: Tiro triplo em leque ---
} else if (tiro) and cd <= 0 and global.formato = 2 {
    var shot  = instance_create_layer(x, y, "tiros", obj_tiro); // Projétil central
    var shot2 = instance_create_layer(x, y, "tiros", obj_tiro); // Projétil desviado +10°
    var shot3 = instance_create_layer(x, y, "tiros", obj_tiro); // Projétil desviado -10°
    shot.speed  = 15;
    shot2.speed = 15;
    shot3.speed = 15;
    shot.direction  = point_direction(x, y, mouse_x, mouse_y);
    shot2.direction = point_direction(x, y, mouse_x, mouse_y) + 10;
    shot3.direction = point_direction(x, y, mouse_x, mouse_y) - 10;
    cd = 25;

// --- FORMATO 3: Tiro único, velocidade média (penetrante) ---
} else if (tiro) and cd <= 0 and global.formato = 3 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 15;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 25;

// --- FORMATO 4: Tiro único, velocidade baixa ---
} else if (tiro) and cd <= 0 and global.formato = 4 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 10;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 25;

// --- FORMATO 5: Igual ao formato 4 (efeito especial definido em outro trecho) ---
} else if (tiro) and cd <= 0 and global.formato = 5 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 10;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 25;

// --- FORMATO 6: Tiro único, velocidade máxima ---
} else if (tiro) and cd <= 0 and global.formato = 6 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 25;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 25;

// --- FORMATO 7: Tiro único, velocidade média ---
} else if (tiro) and cd <= 0 and global.formato = 7 {
    var shot = instance_create_layer(x, y, "tiros", obj_tiro);
    shot.speed     = 15;
    shot.direction = point_direction(x, y, mouse_x, mouse_y);
    cd = 25;
}
#endregion
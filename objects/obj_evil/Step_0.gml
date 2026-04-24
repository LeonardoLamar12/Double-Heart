// Calcula a direção em graus do inimigo até o jogador
dir = point_direction(x, y, obj_player.x, obj_player.y);

// Calcula as componentes de velocidade horizontal e vertical com base na direção
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

// Movimento horizontal com colisão simples (sem pixel a pixel)
if (!place_meeting(x + hspd, y, obj_col)) {
    x += hspd; // Move normalmente se não houver obstáculo
} else {
    hspd = 0;  // Para o movimento horizontal ao colidir
}

// Movimento vertical com colisão simples
if (!place_meeting(x, y + vspd, obj_col)) {
    y += vspd; // Move normalmente se não houver obstáculo
} else {
    vspd = 0;  // Para o movimento vertical ao colidir
}

// Reseta a cor do sprite para branco (sem tingimento)
image_blend = c_white;

// Verifica se foi atingido por um projétil do jogador e se o cooldown de dano já passou
if distance_to_object(obj_tiro) < 1 and cd > 20 {

    // Formato 7 causa dano duplo neste inimigo
    if global.formato = 7 {
        screen_shake(7, 20); // Tremor de tela mais intenso
        image_blend = c_red; // Tinge de vermelho indicando dano
        vida -= 2;           // Remove 2 pontos de vida (dano duplo)
        cd = 0;              // Reseta o cooldown de dano
    } else {
        screen_shake(5, 20); // Tremor de tela padrão
        image_blend = c_red;
        vida -= 1;           // Remove 1 ponto de vida (dano normal)
        cd = 0;
    }
}

// Se a vida chegar a zero ou menos, destroi o inimigo
if vida <= 0 {
    instance_destroy(self);
}

// Aplica efeito de lentidão se estiver dentro do alcance do obj_slow
if distance_to_object(obj_slow) < 1 {
    spd = max_spd / 2; // Reduz a velocidade para metade
} else {
    spd = max_spd;     // Mantém a velocidade máxima normal
}

// Espelha o sprite conforme a posição do jogador
if obj_player.x < x {
    image_xscale = 1;  // Jogador à esquerda: sprite normal
} else {
    image_xscale = -1; // Jogador à direita: sprite espelhado
}
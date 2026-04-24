// Loop que roda enquanto o contador global.i for menor que a dificuldade atual
// Ou seja, spawna inimigos em quantidade igual ao valor de global.dif
while global.i < global.dif {

    // --- DIFICULDADE BAIXA (5 ou menos): apenas 3 tipos de inimigo disponíveis ---
    if global.dif <= 5 {
        var r = irandom_range(1, 3); // Sorteia um número aleatório entre 1 e 3

        if r == 1 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil1)
        } else if r == 2 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil2)
        } else if r == 3 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil3)
        }
        // choose(290,1160) sorteia aleatoriamente entre as coordenadas X das bordas do mapa
        // choose(200,570)  sorteia aleatoriamente entre as coordenadas Y das bordas do mapa
        // Os inimigos sempre aparecem nos cantos/extremidades da arena

    // --- DIFICULDADE ALTA (acima de 5): 7 tipos de inimigo disponíveis ---
    } else if global.dif > 5 {
        var r = irandom_range(1, 7); // Sorteia um número aleatório entre 1 e 7

        if r == 1 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil1)
        } else if r == 2 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil2)
        } else if r == 3 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil3)
        } else if r == 4 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil4) // Inimigo exclusivo de dif alta
        } else if r == 5 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil5) // Inimigo exclusivo de dif alta
        } else if r == 6 {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil6) // Inimigo exclusivo de dif alta
        } else {
            instance_create_layer(choose(290,1160), choose(200,570), "Instances", obj_evil7) // Inimigo exclusivo de dif alta
        }
    }

    global.i += 1; // Incrementa o contador para controlar quantos inimigos já foram spawnados
}

// Se o jogador pressionar ESC, volta para o menu e destroi o jogador e o objeto controlador
if keyboard_check_pressed(vk_escape) {
    room_goto(roomMenu);
    instance_destroy(obj_player); // Remove o jogador da cena
    instance_destroy(self);       // Remove o próprio objeto controlador (provavelmente obj_gamemanager ou similar)
}
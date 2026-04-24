// Se o jogador estiver muito próximo (praticamente tocando) E a variável global.esse for verdadeira,
// destroi esta instância (item de essência coletado pelo jogador)
if distance_to_object(obj_player) < 0.1 and global.esse {
    instance_destroy(self);
}

// Mesma lógica, mas verifica global.forma em vez de global.esse
// Provavelmente um item de formato sendo coletado pelo jogador
if distance_to_object(obj_player) < 0.1 and global.forma {
    instance_destroy(self);
}

// Incrementa o temporizador a cada frame para controlar a animação de flutuação
tempo += 0.05;

// Desloca o objeto verticalmente com uma onda senoidal, criando efeito de flutuação
y = base_y + sin(tempo) * 10;
// base_y = posição vertical original do objeto
// sin(tempo) oscila entre -1 e +1
// * 10 define a amplitude da flutuação em pixels
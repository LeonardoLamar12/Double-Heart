// Guarda apenas o sinal da velocidade horizontal (-1, 0 ou 1), indicando a direção do movimento
var velh = sign(hspd)

// Guarda apenas o sinal da velocidade vertical (-1, 0 ou 1), indicando a direção do movimento
var velv = sign(vspd)

// Repete o movimento horizontal pixel a pixel, a quantidade de vezes igual ao valor absoluto de hspd
repeat (abs(hspd)) {
    // Verifica se há colisão com obj_col um pixel à frente na direção horizontal
    if place_meeting(x + velh, y, obj_col) {
        hspd = 0; // Para o movimento horizontal ao encontrar uma parede/obstáculo
    } else {
        x += velh; // Move um pixel na direção horizontal se não houver colisão
    }
}

// Repete o movimento vertical pixel a pixel, a quantidade de vezes igual ao valor absoluto de vspd
repeat (abs(vspd)) {
    // Verifica se há colisão com obj_col um pixel à frente na direção vertical
    if place_meeting(x, y + velv, obj_col) {
        vspd = 0; // Para o movimento vertical ao encontrar uma parede/obstáculo
    } else {
        y += velv; // Move um pixel na direção vertical se não houver colisão
    }
}
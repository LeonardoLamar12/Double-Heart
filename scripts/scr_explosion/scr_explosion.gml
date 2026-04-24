function explosion_particles(px, py, cor) {
    
    // define a cor da partícula
    part_type_color1(global.part_explosion, cor);
    
    // cria as partículas
    part_particles_create(global.part_sys, px, py, global.part_explosion, 20);
}
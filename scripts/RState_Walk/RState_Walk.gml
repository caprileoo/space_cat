function RState_Walk() {
    vsp += grv;
    
    image_speed = 1;
    sprite_index = SRMouseRun;
    image_xscale = moveDirection; //ranged enemy sprite turn around
    
    if(hitwall()){
        moveDirection *= -1;
    }
    
    if (on_ground_specific(OEdge) && state != RSTATE.ATK) {
        state = RSTATE.IDLE;
        moveDirection *= -1;
        timer = 0;
    }
    
    hsp = moveDirection; //divide = low speed | multiply = high speed
    
    if (on_ground_specific(OEdge)) {
        timer = 0;
    }
	
	move_n_collide(collision_objects);
}
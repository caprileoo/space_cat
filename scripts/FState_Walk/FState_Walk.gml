function FState_Walk(){
    vsp += grv;
    
    image_speed = 1;
    sprite_index = SFMouseRun;
    image_xscale = moveDirection; //ranged enemy sprite turn around
    
    if(hitwall()){
        moveDirection *= -1;
    }
    
    if (on_ground_specific(OEdge) and state != FSTATE.ATK and pre_edge == false) {
		pre_edge = true;
        moveDirection *= -1;
		timer = 0;
		state = FSTATE.IDLE;
    } else pre_edge = false;
    
    hsp = moveDirection; //divide = low speed | multiply = high speed
	
	move_n_collide(collision_objects);
}
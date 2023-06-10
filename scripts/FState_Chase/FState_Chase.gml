function FState_Chase(){
    vsp += grv;
    
    image_speed = 1;
    sprite_index = SFMouseRun;
	image_xscale = sign(target.x - x);
	
	hsp = 2 * sign(target.x - x);
    
    if (on_ground_specific(OEdge) and state != FSTATE.ATK and pre_edge == false) {
		pre_edge = true;
        moveDirection *= -1;
		timer = 0;
		state = FSTATE.IDLE;
    } else pre_edge = false;
	
	move_n_collide(collision_objects);
}
function SState_Walk(){
	vsp += grv;
	
	image_xscale = moveDirection;
	
	image_speed = 1;
	sprite_index = SSlimeMove;
	
	if(hitwall()){
		moveDirection *= -1;
	}
	
	if (move_alarm > 0) {
	    move_alarm--;
	    hsp = moveDirection;
	} else if (rest_alarm > 0) {
	    rest_alarm--;
	    hsp = 0;
	} else {
	    move_alarm = moving_time;
	    rest_alarm = resting_time;
	}
	
	if (on_ground_specific(OEdge) and state != SSTATE.ATK and pre_edge == false) {
		pre_edge = true;
		edge_timer++;
        moveDirection *= -1;
		timer = 0;
		state = SSTATE.WALK;
    } else if(edge_timer > 2) {
		pre_edge = false;
		edge_timer = 0;
	}
	
	move_n_collide(collision_objects);
}
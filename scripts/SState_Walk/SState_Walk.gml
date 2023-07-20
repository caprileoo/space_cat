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
	    hsp = moveDirection / 1.5;
	} else if (rest_alarm > 0) {
	    rest_alarm--;
	    hsp = 0;
	} else {
	    move_alarm = moving_time;
	    rest_alarm = resting_time;
	}
	
	move_n_collide(collision_objects);
}
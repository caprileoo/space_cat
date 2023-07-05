function SState_Chase(){
	vsp += grv;
	
	moveDirection = sign(target.x - x); // Move towards the target
	
	image_xscale = moveDirection;
	
	image_speed = 2;
	sprite_index = SSlimeMove;
	   
	if (move_alarm > 0) {
	    move_alarm--;
	    hsp = moveDirection * 2;
	} else if (rest_alarm > 0) {
	    rest_alarm--;
	    hsp = 0;
	} else {
	    move_alarm = moving_time;
	    rest_alarm = resting_time;
	}
	
	move_n_collide(collision_objects);
}
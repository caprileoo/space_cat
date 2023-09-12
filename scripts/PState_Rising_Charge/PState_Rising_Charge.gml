function PState_Rising_Charge(){
	
	var move = key_right - key_left;
	plasma_charge_time++;
	
	if (move != 0) image_xscale = move;
	moving();
	
	if(!key_jump){
		vsp += stopping_grv;
		if (vsp > max_vsp) vsp = max_vsp;
	} else {
		vsp += grv;
		if (vsp > max_vsp) vsp = max_vsp;
	}
	
	if(vsp >= 0){
		state = PSTATE.FALLING_CHARGE;
	}
	
	if (!key_plasma){
		state = PSTATE.RISING_RELEASE;
	}
	
	if(place_meeting(x, y, oCheeseWaterfall)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
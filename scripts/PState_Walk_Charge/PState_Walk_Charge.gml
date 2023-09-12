function PState_Walk_Charge(){
	
	var move = key_right - key_left;
	plasma_charge_time++;
	
	if(move == 0 and hsp == 0){
		hsp = 0;
		vsp = 0;
		state = PSTATE.IDLE_CHARGE;
	}
	
	if (move != 0) image_xscale = move;
	moving();
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING_CHARGE;
	}
	
	if(!on_ground()){
		pre_move = true;
		state = PSTATE.FALLING_CHARGE;
	} else pre_move = false;
	
	if (!key_plasma){
		state = PSTATE.WALK_RELEASE;
	}
	
	if(place_meeting(x, y, oCheeseWaterfall) or place_meeting(x, y, oCheeseLava)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
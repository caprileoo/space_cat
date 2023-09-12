function PState_Falling_Charge(){

	var move = key_right - key_left;
	plasma_charge_time++;
	
	if (move != 0) image_xscale = move;
	
	if (pre_move == true or pre_idle = true){
		if (++can_jump_timer < coyote_time and key_jump){
			vsp = j_velocity;
			pre_move = false;
			pre_idle = false;
			can_jump_timer = 0;
			state = PSTATE.RISING_CHARGE;
		}
	}

	moving();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
		pre_idle = false;
		pre_move = false;
		can_jump_timer = 0;
		if(move == 0){
			hsp = 0;
			vsp = 0;
			state = PSTATE.IDLE_CHARGE;
		} else {
			state = PSTATE.WALK_CHARGE;
		}
	}
	
	if (!key_plasma){
		state = PSTATE.FALLING_RELEASE;
	}
	
	if(place_meeting(x, y, oCheeseWaterfall) or place_meeting(x, y, oCheeseLava)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
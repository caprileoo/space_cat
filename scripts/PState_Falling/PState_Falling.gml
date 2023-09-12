function PState_Falling(){
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	if (pre_move == true or pre_idle = true){
		if (++can_jump_timer < coyote_time and key_jump){
			vsp = j_velocity;
			pre_move = false;
			pre_idle = false;
			can_jump_timer = 0;
			state = PSTATE.RISING;
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
			state = PSTATE.IDLE;
		} else {
			state = PSTATE.WALK;
		}
	}
	
	if (key_plasma){
		
        if (!plasma_fired) {
            plasma_timer++;
        }
		
        if (plasma_timer >= plasma_delay) {
            state = PSTATE.FALLING_CHARGE;
            plasma_timer = 0;
            plasma_fired = true;
        }
		
    } else {
        plasma_fired = false; // Reset boolean variable when key is released
        plasma_timer = 0; // Reset timer when key is released
    }
	
	if(place_meeting(x, y, oCheeseWaterfall)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
function PState_Walk(){
	
	var move = key_right - key_left;
	
	if(move == 0 and hsp == 0){
		hsp = 0;
		vsp = 0;
		state = PSTATE.IDLE;
	}
	
	if (move != 0) image_xscale = move;
	moving();
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		pre_move = true;
		state = PSTATE.FALLING;
	} else pre_move = false;
	
	if (key_atk and on_ground()) {
		atk_timer++;
		state = PSTATE.COMBO1;
	}
	
	if (key_plasma){
		
        if (!plasma_fired) {
            plasma_timer++;
        }
		
        if (plasma_timer >= plasma_delay) {
            state = PSTATE.WALK_CHARGE;
            plasma_timer = 0;
            plasma_fired = true;
        }
		
    } else {
        plasma_fired = false; // Reset boolean variable when key is released
        plasma_timer = 0; // Reset timer when key is released
    }
	
	if(place_meeting(x, y, oCheeseWaterfall) or place_meeting(x, y, oCheeseLava)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
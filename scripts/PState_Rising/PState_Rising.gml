function PState_Rising(){
	
	if(plasma_using){
		sprite_index = SCatShootAir;
		
		if(vsp > -2){
			sprite_index = SCatShootMidAir;
		}
	} else {
		sprite_index = sCatAir;
		
		if(vsp > -2){
			sprite_index = SCatMidAir;
		}
	}

	var move = key_right - key_left;
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
		state = PSTATE.FALLING;
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
	
	move_n_collide(collision_objects);
}
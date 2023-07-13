function PState_Idle(){
	
	if(plasma_using){
		sprite_index = SCatShootIdle;
	} else sprite_index = sCat;
	
	var move = key_right - key_left;
	
	if(move != 0){
		state = PSTATE.WALK;
	}
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		pre_idle = true;
		state = PSTATE.FALLING;
	} else pre_idle = false;
	
	if (key_atk and on_ground()) {
		atk_timer++;
		state = PSTATE.COMBO1;
	}
	
	if (key_plasma){
		
        if (!plasma_fired) {
            plasma_timer++;
        }
		
        if (plasma_timer >= plasma_delay) {
            state = PSTATE.IDLE_CHARGE;
            plasma_timer = 0;
            plasma_fired = true;
        }
		
    } else {
        plasma_fired = false; // Reset boolean variable when key is released
        plasma_timer = 0; // Reset timer when key is released
    }
	
	move_n_collide(collision_objects);
}
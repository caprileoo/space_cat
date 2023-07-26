function PState_Falling_Release(){
	
	plasma_using = true;
	
	get_dir();
	
	if (plasma_charge_time > 0) {
		var plasma;
		if (plasma_charge_time > 25 and energy >= 2) {
			plasma = instance_create_layer(x, y, "Instances", OBigPlasma);
			energy -= 2;
			
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
		} 
		else if (energy >= 1) {
			plasma = instance_create_layer(x, y, "Instances", OPlasma);
			energy -= 1;
			
			plasma.direction = dir;
			plasma.speed = 7;
			plasma_charge_time = 0;
		}
	}
	
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
	
	move_n_collide(collision_objects);
}
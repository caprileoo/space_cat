function PState_Idle_Charge(){
	var move = key_right - key_left;
	plasma_charge_time++;
	
	if(move != 0){
		image_index = 0;
		state = PSTATE.WALK_CHARGE;
	}
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING_CHARGE;
	}
	
	if(!on_ground()){
		image_index = 0;
		pre_idle = true;
		state = PSTATE.FALLING_CHARGE;
	} else pre_idle = false;
	
	if(!key_plasma){
		hsp = 0;
		vsp = 0;
		state = PSTATE.IDLE_RELEASE;
	}
	
	move_n_collide(collision_objects);
}
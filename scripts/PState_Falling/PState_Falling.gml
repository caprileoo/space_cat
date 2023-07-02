function PState_Falling(){
	
	sprite_index = SCatFall;
	
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
			image_index = 0;
			state = PSTATE.IDLE;
		} else {
			image_index = 0;
			state = PSTATE.WALK;
		}
	}
	
	if (key_atk and on_ground()) state = PSTATE.COMBO1;
	
	move_n_collide(collision_objects);
}
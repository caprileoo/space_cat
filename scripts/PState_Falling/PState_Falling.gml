function PState_Falling(){
	
	sprite_index = SCatFall;
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	if (pre_move == true){
		if (++can_jump_timer < coyote_time and key_jump){
			vsp = j_velocity;
			pre_move = false;
			state = PSTATE.RISING;
		}
	}

	moving();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
		can_jump_timer = 0;
		pre_move = false;
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
	
	get_dir();
	move_n_collide();
	
	while(place_meeting(x, y, Owall)) y--;
}
function PState_Falling(){
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	//if (pre_move = true){
	//	if (++can_jump_timer < coyote_time and key_jump){
	//		state = PSTATE.RISING;
	//		can_jump_timer = 0;
	//	}
	//}

	moving();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
		if(move == 0){
			state = PSTATE.IDLE;
		} else {
			state = PSTATE.WALK;
		}
	}
	//if(vsp >= 0) sprite_index = SCatFall;
	
	get_dir();
	move_n_collide();
	
	while(place_meeting(x, y, Owall)) y--;
}
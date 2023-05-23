function PState_Falling(){
	show_debug_message("Falling");
	
	//show_debug_message(can_jump_timer);
	//show_debug_message(coyote_time);
	//show_debug_message(pre_move);
	
	can_jump_timer++;
	
	if (pre_move == true){
		show_debug_message("coyote!");
		if (can_jump_timer < coyote_time and key_jump){
			vsp = j_velocity;
			pre_move = false;
			can_jump_timer = 0;
			state = PSTATE.RISING;
		}
	}

	var move = key_right - key_left;
	if (move != 0) image_xscale = move;

	moving();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
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
	
	get_dir();
	move_n_collide();
	
	sprite_index = SCatFall;
	while(place_meeting(x, y, Owall)) y--;
}
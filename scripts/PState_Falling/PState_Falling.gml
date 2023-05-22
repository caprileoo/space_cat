function PState_Falling(){
	show_debug_message("falling");
	var move = key_right - key_left;

	moving();
	//coyote_time = 0;
	//coyotetime();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
		if(move == 0){
			state = PSTATE.IDLE;
		} else state = PSTATE.WALK;
	}
	
	get_dir();
	move_n_collide();
	update();
	animation();
}
function PState_Rising(){
	show_debug_message("rising");
	vsp = j_velocity;
	
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
	
	moving();
	get_dir();
	move_n_collide();
	update();
	animation();
}
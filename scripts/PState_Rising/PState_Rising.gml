function PState_Rising(){
	show_debug_message("rising");
	vsp = j_velocity;
	coyote_time = 0;
	
	moving();
	coyotetime();
	
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
	
	get_dir();
	move_n_collide();
	update();
	animation();
	//while(place_meeting(x, y, Owall)) y--
}
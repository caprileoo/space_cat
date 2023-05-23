function PState_Rising(){
	show_debug_message("rising");
	
	sprite_index = sCatAir;
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	moving();
	
	if(!key_jump){
		vsp += stopping_grv;
		if (vsp > max_vsp) vsp = max_vsp;
	} else {
		vsp += grv;
		if (vsp > max_vsp) vsp = max_vsp;
	}
	
	if(vsp >= 0){
		image_index = 0;
		sprite_index = SCatMidAir;
		state = PSTATE.FALLING;
	}
	
	get_dir();
	
	move_n_collide();

	while(place_meeting(x, y, Owall)) y--;
}
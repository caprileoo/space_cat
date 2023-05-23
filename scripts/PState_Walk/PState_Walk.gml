function PState_Walk(){
	show_debug_message("walking");
	
	var move = key_right - key_left;
	
	pre_walk = true;
	
	if(move == 0 and hsp == 0){
		state = PSTATE.IDLE;
	}
	
	if (move != 0) image_xscale = move;
	moving();
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
		pre_walk = false;
	}
	
	if(!on_ground()){
		state = PSTATE.FALLING;
	}
	
	get_dir();
	move_n_collide();
	shing();
	pew();
	
	sprite_index = sCatRun;
	while(place_meeting(x, y, Owall)) y--;
}
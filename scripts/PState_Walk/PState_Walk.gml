function PState_Walk(){
	show_debug_message("walking");
	var move = key_right - key_left;
	
	if(move == 0 and hsp == 0){
		state = PSTATE.IDLE;
	}
	
	moving();
	
	if(check_jump()){
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		state = PSTATE.FALLING;
	}
	
	get_dir();
	move_n_collide();
	update();
	animation();
	shing();
	pew();
}
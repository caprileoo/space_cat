function PState_Idle(){
	show_debug_message("idle")
	var move = key_right - key_left;
	vsp += grv;
	
	if(move != 0){
		state = PSTATE.WALK;
	}
	
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
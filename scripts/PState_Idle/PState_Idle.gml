function PState_Idle(){
	show_debug_message("idle")
	
	hsp = 0;
	vsp = 0;
	pre_idle = true;
	vsp += grv;
	var move = key_right - key_left;
	
	if(move != 0){
		state = PSTATE.WALK;
	}
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
		pre_idle = false;
	}
	
	if(!on_ground()){
		state = PSTATE.FALLING;
	}
	
	get_dir();
	move_n_collide();
	shing();
	pew();
	sprite_index = sCat;
}
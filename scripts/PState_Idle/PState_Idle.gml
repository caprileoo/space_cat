function PState_Idle(){
	
	hsp = 0;
	vsp = 0;
	vsp += grv;
	var move = key_right - key_left;
	
	if(move != 0){
		state = PSTATE.WALK;
	}
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
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
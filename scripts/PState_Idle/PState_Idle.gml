function PState_Idle(){
	
	sprite_index = sCat;
	if(key_plasma) pew();
	
	var move = key_right - key_left;
	
	if(move != 0){
		image_index = 0;
		state = PSTATE.WALK;
	}
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		image_index = 0;
		state = PSTATE.FALLING;
	}
	
	get_dir();
	move_n_collide();
	shing();
	pew();
	reload();
}
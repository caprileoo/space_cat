function PState_Walk(){
	
	var move = key_right - key_left;
	
	if(move == 0 and hsp == 0){
		state = PSTATE.IDLE;
	}
	
	if (move != 0) image_xscale = move;
	moving();
	
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
	
	sprite_index = sCatRun;
	while(place_meeting(x, y, Owall)) y--;
}
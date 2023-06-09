function PState_Walk(){
	
	sprite_index = sCatRun;
	
	reload();
	pew();
	shing();
	
	var move = key_right - key_left;
	
	if(move == 0 and hsp == 0){
		hsp = 0;
		vsp = 0;
		image_index = 0;
		state = PSTATE.IDLE;
	}
	
	if (move != 0) image_xscale = move;
	moving();
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		image_index = 0;
		pre_move = true;
		state = PSTATE.FALLING;
	} else pre_move = false;
	
	move_n_collide(collision_objects);
}
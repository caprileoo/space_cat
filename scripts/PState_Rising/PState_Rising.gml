function PState_Rising(){
	
	sprite_index = sCatAir;
	
	reload();
	pew();
	shing();
	
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
		sprite_index = SCatMidAir;
		
		if(animation_end(SCatMidAir, 2)){
			image_index = 0;
			state = PSTATE.FALLING;
		}
	}
	
	move_n_collide();
	reload();
}
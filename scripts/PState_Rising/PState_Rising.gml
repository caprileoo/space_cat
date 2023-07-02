function PState_Rising(){
	
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
		sprite_index = SCatMidAir;
		
		if(animation_end(SCatMidAir, 2)){
			image_index = 0;
			state = PSTATE.FALLING;
		}
	}
	
	if (key_atk and on_ground()) state = PSTATE.COMBO1;
	
	move_n_collide(collision_objects);
}
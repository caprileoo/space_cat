function PState_Charge(){
	
	sprite_index = sCat;
	
	hsp = 0;
	vsp = 0;
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	moving();
	move_n_collide(collision_objects);

	plasma_charge_time++;
	if(!key_plasma){
		hsp = 0;
		vsp = 0;
		state = PSTATE.RELEASE;
	}
}
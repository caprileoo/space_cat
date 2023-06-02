function PState_Release(){
	
	sprite_index = sCat;
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	moving();
	move_n_collide();
	get_dir();
	
	if (plasma_charge_time > 0) {
		var plasma;
		if (plasma_charge_time > 10 and energy >= 2) {
			plasma = instance_create_layer(x , y, "Instances", OBigPlasma);
			energy -= 2;
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
			state = PSTATE.IDLE;
		} else if (energy >= 1) {
			plasma = instance_create_layer(x, y, "Instances", OPlasma);
			energy -= 1;
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
			state = PSTATE.IDLE;
		} else state = PSTATE.IDLE;
	}
}
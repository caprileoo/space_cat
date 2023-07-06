function PState_Walk_Release(){
	get_dir();
	
	if (plasma_charge_time > 0) {
		var plasma;
		if (plasma_charge_time > 25 and energy >= 2) {
			plasma = instance_create_layer(x , y, "Instances", OBigPlasma);
			energy -= 2;
			
			if(dir == 0){
				plasma.image_angle = 0;
			} else plasma.image_angle = 180;
			
			plasma.direction = dir;
			plasma.speed = 3;
			plasma_charge_time = 0;
		} 
		else if (energy >= 1) {
			plasma = instance_create_layer(x, y, "Instances", OPlasma);
			energy -= 1;
			
			if(dir == 0){
				plasma.image_angle = 0;
			} else plasma.image_angle = 180;
			
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
		} 
	}
	
	var move = key_right - key_left;
	
	if(move == 0 and hsp == 0){
		hsp = 0;
		vsp = 0;
		state = PSTATE.IDLE;
	}
	
	if(move != 0){
		state = PSTATE.WALK;
	}
			
	if (move != 0) image_xscale = move;
	moving();
	
	if(check_jump()){
		vsp = j_velocity;
		state = PSTATE.RISING;
	}
	
	if(!on_ground()){
		pre_move = true;
		state = PSTATE.FALLING;
	} else pre_move = false;
	
	move_n_collide(collision_objects);
}
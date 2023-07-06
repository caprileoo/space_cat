function PState_Falling_Release(){
	get_dir();
	var offset_x = 20;
	if(dir == 180){
		offset_x = -offset_x;
	}
	
	if (plasma_charge_time > 0) {
		var plasma;
		if (plasma_charge_time > 25 and energy >= 2) {
			plasma = instance_create_layer(x + offset_x , y + 1, "Instances", OBigPlasma);
			energy -= 2;
			
			plasma.direction = dir;
			plasma.speed = 3;
			plasma_charge_time = 0;
		} 
		else if (energy >= 1) {
			plasma = instance_create_layer(x + offset_x, y + 5, "Instances", OPlasma);
			energy -= 1;
			
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
		}
	}
	
	var move = key_right - key_left;
	if (move != 0) image_xscale = move;
	
	if (pre_move == true or pre_idle = true){
		if (++can_jump_timer < coyote_time and key_jump){
			vsp = j_velocity;
			pre_move = false;
			pre_idle = false;
			can_jump_timer = 0;
			state = PSTATE.RISING;
		}
	}

	moving();

	vsp += grv;
	if (vsp > max_vsp) vsp = max_vsp;
	
	if(on_ground()){
		pre_idle = false;
		pre_move = false;
		can_jump_timer = 0;
		if(move == 0){
			hsp = 0;
			vsp = 0;
			state = PSTATE.IDLE;
		} else {
			state = PSTATE.WALK;
		}
	}
	
	move_n_collide(collision_objects);
}
function PState_Rising_Release(){
	
	plasma_using = true;
	
	get_dir();
	
	if (plasma_charge_time > 0) {
		var plasma;
		if (plasma_charge_time > 25 and energy >= 2) {
			plasma = instance_create_layer(x, y, "Instances", OBigPlasma);
			energy -= 2;
			
			plasma.direction = dir;
			plasma.speed = 5;
			plasma_charge_time = 0;
		} 
		else if (energy >= 1) {
			plasma = instance_create_layer(x, y, "Instances", OPlasma);
			energy -= 1;
			
			plasma.direction = dir;
			plasma.speed = 7;
			plasma_charge_time = 0;
		} 
	}
	
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
		state = PSTATE.FALLING;
	}
	
	if (key_plasma){
		
        if (!plasma_fired) {
            plasma_timer++;
        }
		
        if (plasma_timer >= plasma_delay) {
            state = PSTATE.RISING_CHARGE;
            plasma_timer = 0;
            plasma_fired = true;
        }
		
    } else {
        plasma_fired = false; // Reset boolean variable when key is released
        plasma_timer = 0; // Reset timer when key is released
    }
	
	if(place_meeting(x, y, oCheeseWaterfall) or place_meeting(x, y, oCheeseLava)){
		state = PSTATE.SWIMMING;
	}
	
	move_n_collide(collision_objects);
}
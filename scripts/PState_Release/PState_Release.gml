function PState_Release(){
	if(!key_plasma){
		if (plasma_charge_time > 0) {
			var plasma;
			if (plasma_charge_time > 10 && energy >= 2) {
				plasma = instance_create_layer(x , y, "Instances", OBigPlasma);
				energy -= 2;
				get_dir();
				plasma.direction = dir;
				plasma.speed = 5;
			} else if (energy >= 1) {
				plasma = instance_create_layer(x, y, "Instances", OPlasma);
				energy -= 1;
				get_dir();
				plasma.direction = dir;
				plasma.speed = 5;
			}
			plasma_charge_time = 0;
		}
		state = PSTATE.IDLE;
	}
	move_n_collide();
}
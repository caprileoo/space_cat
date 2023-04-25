function PState_Release(){
	if (plasma_charge_time > 0) {
		var plasma;
	    if (plasma_charge_time > 10) {
	        plasma = instance_create_layer(x , y, "Instances", OBigPlasma);
	    } else {
	        plasma = instance_create_layer(x, y, "Instances", OPlasma);
	    }
		get_dir();
		plasma.direction = dir;
		plasma.speed = 5;
	    plasma_charge_time = 0;
		state = PSTATE.FREE;
	}
}
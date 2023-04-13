function PState_Release(){
	show_debug_message("Bam || chargetime = {0}", plasma_charge_time);
	if (plasma_charge_time > 0) {
		var plasma;
	    if (plasma_charge_time < room_speed * 2) {
	        plasma = instance_create_layer(x , y, "Instances", OBigPlasma);
	    } else {
	        plasma = instance_create_layer(x, y, "Instances", OPlasma);
	    }
		plasma.direction = dir;
		plasma.speed = 5;
	    plasma_charge_time = 0;
		state = PSTATE.FREE;
	}
}
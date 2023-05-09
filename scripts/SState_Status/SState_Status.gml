function SState_Status(){
	vsp += grv;
	
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update()
	animation();
	
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and (on_ground(Owall) or on_ground(OPlatform))){
			state = SSTATE.ATK;
		} else if (sign(hsp) == sign(target.x - x) && abs(y - target.y) < 10 ) { // Threshold Height Detection
			state = SSTATE.CHASE;
		} else state = SSTATE.FREE;
	} else state = SSTATE.FREE;
}
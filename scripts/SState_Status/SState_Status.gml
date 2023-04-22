function SState_Status(){
	vsp += grv;
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	animation();
	
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and (on_ground(Owall) or on_ground(OPlatform))){
			state = SSTATE.ATK;
		} else state = SSTATE.CHASE;
	} else state = SSTATE.FREE;
}
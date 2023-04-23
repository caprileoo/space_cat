function EState_Status(){
	vsp += grv;
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and (on_ground(Owall) or on_ground(OPlatform))){
			state = ESTATE.ATK;
		} else state = ESTATE.CHASE;
	} else state = ESTATE.FREE;
}
function FState_Status(){
	vsp += grv;
	move_n_collide();
	update();
	animation();
	
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and (on_ground())){
			state = FSTATE.ATK;
		} else state = FSTATE.CHASE;
	} else state = FSTATE.FREE;
}
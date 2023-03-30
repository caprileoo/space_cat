function EState_Status(){
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		state = ESTATE.CHASE;
	} else {
		state = ESTATE.FREE;
	}
}
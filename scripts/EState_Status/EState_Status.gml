function EState_Status(){
	var on_ground = place_meeting(x,y+1,Owall) or (place_meeting(x,y+1,OPlatform));
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and on_ground){
			state = ESTATE.ATK;
		} else state = ESTATE.CHASE;
	} else state = ESTATE.FREE;
}
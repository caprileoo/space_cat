function RState_Status(){
	vsp += grv;
	move_n_collide();
	update();
	animation();
	
	if(point_distance(x, y, target.x, target.y) <= detectionRadius and on_ground()){
		state = RSTATE.ATK;
	} else state = RSTATE.FREE;
}
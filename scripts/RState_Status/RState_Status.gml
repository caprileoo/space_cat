function RState_Status(){
	show_debug_message("Processing");
	vsp += grv;
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	
	if(point_distance(x, y, target.x, target.y) <= detectionRadius and (on_ground(Owall) or on_ground(OPlatform)))
	{
		state = RSTATE.ATK;
	} else state = RSTATE.FREE;
}
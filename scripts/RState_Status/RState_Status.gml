function RState_Status(){
	show_debug_message("Processing");
	vsp += grv;
	move_n_collide(Owall);
	update();
	animation();
	
	if(point_distance(x, y, target.x, target.y) <= detectionRadius and (on_ground()))
	{
		state = RSTATE.ATK;
	} else state = RSTATE.FREE;
}
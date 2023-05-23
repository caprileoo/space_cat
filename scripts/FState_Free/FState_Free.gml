function FState_Free(){
	vsp += grv;
	roaming();
	move_n_collide();
	update();
	animation();
	state = FSTATE.STATUS;
}
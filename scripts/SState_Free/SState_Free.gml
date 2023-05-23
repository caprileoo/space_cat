function SState_Free() {
	vsp += grv;
	
	roaming();
	move_n_collide();

	update();
	
	animation();
	
	state = SSTATE.STATUS;
}


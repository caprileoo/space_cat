function RState_Free() {
	vsp += grv;
	roaming();
	move_n_collide();
	update();
	animation();
	state = RSTATE.STATUS;
}


function SState_Free() {
	vsp += grv;
	
	roaming();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	
	animation();
	
	state = SSTATE.STATUS;
}


function SState_Free() {
	show_debug_message("Roaming")
	vsp += grv;
	
	roaming();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	
	animation();
	
	state = SSTATE.STATUS;
}


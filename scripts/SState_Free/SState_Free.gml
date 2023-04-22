function SState_Free() {
	vsp += grv;
	
	roaming();
	show_debug_message("Roam: {0}", hsp);
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	
	animation();
	
	state = SSTATE.STATUS;
}


function RState_Free() {
	show_debug_message("Roaming");
	vsp += grv;
	roaming();
	move_n_collide(Owall);
	update();
	animation();
	state = RSTATE.STATUS;
}


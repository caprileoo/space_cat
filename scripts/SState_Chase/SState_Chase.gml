function SState_Chase(){
	show_debug_message("Chase");
	vsp += grv;
	
	move_n_chase();
	show_debug_message("Chase: {0}", hsp);

	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	
	animation();
	
	if (hsp != 0) image_xscale = sign(hsp);
	state = SSTATE.STATUS;
}
function SState_Chase(){
	vsp += grv;
	
	move_n_chase();

	move_n_collide(Owall);
	update();
	
	animation();
	
	if (hsp != 0) image_xscale = sign(hsp);
	state = SSTATE.STATUS;
}
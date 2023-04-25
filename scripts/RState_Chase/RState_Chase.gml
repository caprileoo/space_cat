function RState_Chase(){
	vsp += grv;
	move_n_chase();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	state = RSTATE.STATUS;
}
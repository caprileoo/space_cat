function FState_Chase(){
	vsp += grv;
	jump();
	move_n_chase();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	state = FSTATE.STATUS;
}
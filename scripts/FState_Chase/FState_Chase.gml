function FState_Chase(){
	show_debug_message("Chasing");
	vsp += grv;
	jump();
	move_n_chase();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	state = FSTATE.STATUS;
}
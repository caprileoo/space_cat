function FState_Chase(){
	vsp += grv;
	jump();
	move_n_chase();
	move_n_collide();
	update();
	animation();
	state = FSTATE.STATUS;
}
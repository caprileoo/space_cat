function FState_Free(){
	vsp += grv;
	roaming();
	move_n_collide(Owall);
	update();
	animation();
	state = FSTATE.STATUS;
}
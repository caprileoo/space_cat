function EState_Chase(){	
	vsp += grv;
	move_n_chase();
	jump();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	state = ESTATE.STATUS;
}
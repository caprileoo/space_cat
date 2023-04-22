function PState_Low_Grav(){
	vsp += grv_bender;
	
	moving();
	get_dir();

	coyotetime();
	grav_bender();


	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();

	animation();

	shing();
	pew();
	
	if(key_grav) state = PSTATE.FREE;
}
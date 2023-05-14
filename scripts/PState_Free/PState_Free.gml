function PState_Free(){
	vsp += grv;
	
	moving();
	get_dir();

	coyotetime();
	jumping();


	move_n_collide(Owall);
	update();

	animation();

	shing();
	pew();
	
	if(key_grav) state = PSTATE.LOW_GRAV;
}
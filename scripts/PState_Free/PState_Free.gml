function PState_Free(){
	//show_debug_message(fall_speed);
	show_debug_message(vsp);
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
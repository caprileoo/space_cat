function PState_Free(){
	vsp += grv;
	
	fuel_regen();
	
	moving();
	get_dir();

	coyotetime();
	jumping();

	jet();

	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();

	animation();

	shing();
	pew();
}
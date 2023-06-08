function RState_Idle(){
	vsp += grv;
	
	image_speed = 1;
	sprite_index = SRMouseIdle;
	image_xscale = moveDirection; //ranged enemy sprite turn around
	
	move_n_collide();
	update();
}
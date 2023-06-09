function RState_Idle(){
	hsp = 0;
	vsp += grv;
	
	image_speed = 1;
	sprite_index = SRMouseIdle;
	image_xscale = moveDirection; //ranged enemy sprite turn around
	
	move_n_collide(collision_objects);
}
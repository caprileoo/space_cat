function SState_Idle() {
	vsp += grv;
	
	image_speed = 1;
	sprite_index = SSlimeIdle;
	
	hsp = 0;
	
	move_n_collide(collision_objects);
}
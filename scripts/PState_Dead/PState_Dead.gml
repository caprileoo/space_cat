function PState_Dead(){
	vsp += grv;
	hsp = 0;
	
	if (sprite_index != SCatDed)
	{
		sprite_index = SCatDed;
		image_index = 0;
	}
	
	move_n_collide(collision_objects);

	if (animation_end()) room_restart();
}
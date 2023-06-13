function PState_HitByRanger(){
	vsp += grv;
	
	//Just hit
	if (hitNow)
	{
		sprite_index = SCatHit;
		image_index = 0;
		hitNow = false;
	}
	
	move_n_collide(collision_objects);
}
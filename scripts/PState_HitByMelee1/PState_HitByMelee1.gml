function PState_HitByMelee1(){
	vsp += grv;
	
    if (hitNow)
    {
        sprite_index = SCatHit;
        image_index = 0;
        hitNow = false;
        frameCount = 0;
    }

    frameCount++;
    if (frameCount > 7) 
    {
		hsp = 0;
        frameCount = 0;
        state = PSTATE.IDLE;
    }
	
    move_n_collide(collision_objects);
}
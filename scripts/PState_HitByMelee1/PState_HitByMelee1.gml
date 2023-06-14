function PState_HitByMelee1(){
	
    if (hitNow)
    {
        sprite_index = SCatHit;
        image_index = 0;
        hitNow = false;
        frameCount = 0;
    }

    frameCount++;
    if (frameCount > 5) 
    {
		hsp = 0;
        frameCount = 0;
        state = PSTATE.IDLE;
    }
	
    move_n_collide(collision_objects);
}
function PState_HitByMelee(){
	vsp += grv;
	
    if (hitNow)
    {
        sprite_index = SCatHit;
        image_index = 0;
        hitNow = false;
        frameCount = 0;
        vsp = -3; 
    }

    frameCount++;
    if (frameCount > 5) 
    {
        frameCount = 0;
        state = PSTATE.IDLE;
    }
    move_n_collide(collision_objects);
}
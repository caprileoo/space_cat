function PState_HitBySlime(){
	vsp += grv;
	
	var slime_dir;
	
	with(OSlime){
		slime_dir = image_xscale;
	}
	
    if (hitNow)
    {
        sprite_index = SCatHit;
        image_index = 0;
        hitNow = false;
        frameCount = 0;
		
        vsp = -3; 
		
		if(slime_dir == -1){
			hsp -= 5;
		} else hsp += 5;
    } else {
        vsp = lerp(vsp, 0, 0.1);
        hsp = lerp(hsp, 0, 0.1);
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
function PState_Hit(){
	//Just hit
	if (hitNow)
	{
		sprite_index = SCatHit;
		image_index = 0;
		hitNow = false;
	}
	
	frameCount++;
    if (frameCount > 2) 
    {
		hsp = 0;
        frameCount = 0;
        state = PSTATE.IDLE;
    }
}
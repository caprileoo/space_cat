function FState_Hit(){
	
	if (hitNow)
	{
		sprite_index = SFMouseHit;
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;
		state = FSTATE.IDLE;
	}
}
function SState_Hit() {
	//Just hit
	if (hitNow)
	{
		sprite_index = SSlimeHit;
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;
		state = SSTATE.IDLE;
	}
}
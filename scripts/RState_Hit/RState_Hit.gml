function RState_Hit() {
	if (hitNow)
	{
		sprite_index = SRMouseHit;
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;
		state = RSTATE.WALK;
	}
}
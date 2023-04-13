function EState_Hit() {
	//Just hit
	if (hitNow)
	{
		show_debug_message("ouch");
		sprite_index = SPigHit;
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;
		state = ESTATE.STATUS;
	}
}
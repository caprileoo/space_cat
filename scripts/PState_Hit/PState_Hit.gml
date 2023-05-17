function PState_Hit(){
	//Just hit
	if (hitNow)
	{
		sprite_index = SCatHit;
		image_index = 0;
		hitNow = false;
		//frameCount = 0;
	}
	
	/** Don't uncomment this unless you want the cat to be stunned when getting hit **/
	//frameCount++;
	//if (frameCount > 20) 
	//{
	//	frameCount = 0;
	//	state = PSTATE.FREE;
	//}
	state = PSTATE.FREE;
}
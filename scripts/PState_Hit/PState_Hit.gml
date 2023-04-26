// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PState_Hit(){
	//Just hit
	if (hitNow)
	{
		sprite_index = sCat;
		image_index = 0;
		hitNow = false;
		//frameCount = 0;
	}

	//frameCount++;
	//if (frameCount > 20) 
	//{
	//	frameCount = 0;
	//	state = PSTATE.FREE;
	//}
	state = PSTATE.FREE;
}
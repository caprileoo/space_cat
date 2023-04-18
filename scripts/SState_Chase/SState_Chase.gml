function SState_Chase(){
	show_debug_message("Chase");
	moveDirection = sign(target.x - x); // Move towards the target
	
	waitTimer++;
	if(waitTimer >= wait_chase) {
		hsp = moveDirection * 2; //divide = low speed | multiply = high speed
	}
	
	vsp += grv;
	
	#region Collision
	/**platform horizontal collision**/
	if (place_meeting(x+hsp,y,Owall)) or (place_meeting(x+hsp,y,OPlatform))
	{
		while (!place_meeting(x+sign(hsp),y,Owall)) and(!place_meeting(x+sign(hsp),y,OPlatform))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	/**platform vertical collision**/
	if (place_meeting(x,y+vsp,Owall)) or (place_meeting(x,y+vsp,OPlatform))
	{
		while (!place_meeting(x,y+sign(vsp),Owall)) and (!place_meeting(x,y+sign(vsp),OPlatform))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
	#endregion

	#region Animation
	if (!place_meeting(x,y+1,Owall)) and (!place_meeting(x,y+1,OPlatform))	
	{
		sprite_index = SPigIdle;	
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = SPigIdle;
		}
		else
		{
			sprite_index = SPigRun;
		}
	}
	#endregion
	
	if (hsp != 0) image_xscale = sign(hsp);
	state = SSTATE.STATUS;
}
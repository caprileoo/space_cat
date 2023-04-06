function EState_Free() {
	moveTimer++;
	
	if (moveTimer >= moveDuration) {
		moveDirection *= -1; // Change direction
		moveTimer = 0; // Reset timer
	}
	
	if (place_meeting(x + hsp, y, Owall)) {
		// If there is a wall collision, chagne direction
		moveDirection *= -1; // Change direction
	}
	hsp = moveDirection; //divide = low speed | multiply = high speed

	vsp += grv;
	
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

	/**animations**/
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
	
	if (hsp != 0) image_xscale = sign(hsp); //enemy sprite turn around
	state = ESTATE.STATUS;
}


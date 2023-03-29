function PState_Free(){
	var move = key_right - key_left; //calculate movements

	hsp = move * walksp; //move speed

	vsp += grv;

	/**jumping**/
	if (place_meeting(x,y+1,Owall)) and (key_jump) {
	    vsp = -4.5;
	}
	else if (place_meeting(x,y+1,OPlatform)) and (key_jump) {
	    vsp = -4.5;
	}

	/*sprinting (run faster)
	if (key_sprint_hold && mana >= 2) { //Sprint when hold shift
	    walksp = 4; //sprint speed
		mana -= 2; //lose mana
	} else {
	    walksp = 2.5; //normal walkspeed
	}*/

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
		sprite_index = SKingAir;	
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sKing;
		}
		else
		{
			sprite_index = SKingRun;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp);
	
	if (key_atk) state = PSTATE.ATTACK_SLASH;
}
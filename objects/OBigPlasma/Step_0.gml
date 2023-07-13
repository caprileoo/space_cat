if (place_meeting(x,y,ORanger)) {
	ProcessAttackBurstToRMouse(SBigPlasma,SBigPlasmaHB);  
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
	}
	// Destroy the bullet instance
	instance_destroy();
} else if (place_meeting(x,y,OFighter)) {
	ProcessAttackBurstToFMouse(SBigPlasma,SBigPlasmaHB);  
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
	}
	// Destroy the bullet instance
	instance_destroy();
} else if (place_meeting(x,y,OSlime)) {
	ProcessAttackBurstToSlime(SBigPlasma,SBigPlasmaHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
	}
	// Destroy the bullet instance
	instance_destroy();
}

distanceTraveled += abs(speed * cos(degtorad(direction)));

if(distanceTraveled >= 250){
	distanceTraveled = 0;
	instance_destroy();
}

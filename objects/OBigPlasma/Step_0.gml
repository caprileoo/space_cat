if (place_meeting(x,y,OPig)) {
	// Apply damage to the pig
	ProcessAttackBurstToMouse(SBigPlasma,SBigPlasmaHB);  
	// Reset the bullet's horizontal and vertical speed
	hsp = 0;
	vsp = 0; 
	// Destroy the bullet instance
	instance_destroy();
}
if (place_meeting(x,y,OSlime)) {
	ProcessAttackBurstToSlime(SBigPlasma,SBigPlasmaHB);
	// Reset the bullet's horizontal and vertical speed
	hsp = 0;
	vsp = 0;
	// Destroy the bullet instance
	instance_destroy();
}

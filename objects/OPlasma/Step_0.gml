if (place_meeting(x,y,OPig)) {
	ProcessAttackToMouse(SPlasma,SPlasmaHB);
	// Reset the bullet's horizontal and vertical speed
	hsp = 0;
	vsp = 0;
	// Destroy the bullet instance
	instance_destroy();
} 
if (place_meeting(x,y,OSlime)) {
	ProcessAttackToSlime(SPlasma,SPlasmaHB); 
	// Reset the bullet's horizontal and vertical speed
	hsp = 0;
	vsp = 0;
	// Destroy the bullet instance
	instance_destroy();
}
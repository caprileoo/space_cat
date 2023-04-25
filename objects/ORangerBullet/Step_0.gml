if (place_meeting(x,y,OCat)) {
	RangerProcessAttack(SPlasma,SPlasmaHB);
	// Reset the bullet's horizontal and vertical speed
	hsp = 0;
	vsp = 0;
	// Destroy the bullet instance
	instance_destroy();
} 
if (place_meeting(x,y,OCat)) {
	RangerProcessAttack(SCheesePlasma,SCheesePlasmaHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
	}
	// Destroy the bullet instance
	instance_destroy();
} 
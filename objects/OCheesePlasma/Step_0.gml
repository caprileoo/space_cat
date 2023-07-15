if (place_meeting(x,y,OCat)) {
	RangerProcessAttack(SBigPlasmaExplode,SCheesePlasmaHB);
	if (animation_end())
	{
		speed = 0;
		instance_destroy();
	}
} 
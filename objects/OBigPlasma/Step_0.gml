if (place_meeting(x, y, OPig)) {
    // Apply damage to the pig
    ProcessAttack(SBigPlasma,SBigPlasmaHB);  
	hsp = 0;
	vsp = 0;
    // Destroy the bullet instance
    instance_destroy();
}
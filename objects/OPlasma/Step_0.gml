if (place_meeting(x, y, OPig)) {
    // Apply damage to the pig
    ProcessAttack(SPlasma,SPlasmaHB);   
	hsp = 0;
	vsp = 0;
    // Destroy the bullet instance
    instance_destroy();
}
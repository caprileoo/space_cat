with (other) {
<<<<<<< Updated upstream
	// Apply damage to the pig
	ProcessAttack(SPlasma,SPlasmaHB);  
	// Reset the bullet's horizontal and vertical speed
=======
// Apply damage to the pig
ProcessAttack(SPlasma,SPlasmaHB);  
// Reset the bullet's horizontal and vertical speed
>>>>>>> Stashed changes
	hsp = 0;
	vsp = 0; 
}
// Destroy the bullet instance
instance_destroy();
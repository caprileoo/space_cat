
with (other) {
// Apply damage to the pig
ProcessAttack(SPlasma,SPlasmaHB);  
// Reset the bullet's horizontal and vertical speed
hsp = 0;
vsp = 0; 
}

// Destroy the bullet instance
instance_destroy();
if (place_meeting(x,y,ORanger)) {
    ProcessAttackToRMouse(SPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
} else if (place_meeting(x,y,OFighter)){
    ProcessAttackToFMouse(SPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
} else if (place_meeting(x,y,OSlime)) {
    ProcessAttackToSlime(SPlasmaExplode,SPlasmaHB); 
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
}
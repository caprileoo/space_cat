if (place_meeting(x,y,ORanger)) {
    ProcessAttackToRMouse(SBigPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
} else if (place_meeting(x,y,OFighter)){
    ProcessAttackToFMouse(SBigPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
} else if (place_meeting(x,y,OSlime)) {
    ProcessAttackToSlime(SBigPlasmaExplode,SPlasmaHB); 
    if (animation_end())
    {
		speed = 0;
		instance_destroy();
    }
}
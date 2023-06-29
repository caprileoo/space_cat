if (place_meeting(x,y,ORanger)) {
    ProcessAttackToRMouse(SPlasma,SPlasmaHB);
    if (animation_end())
    {
        hsp = 0;
        vsp = 0;
    }
    // Destroy the bullet instance
    instance_destroy();
} else if (place_meeting(x,y,OFighter)){
    ProcessAttackToFMouse(SPlasma,SPlasmaHB);
    if (animation_end())
    {
        hsp = 0;
        vsp = 0;
    }
    // Destroy the bullet instance
    instance_destroy();
} else if (place_meeting(x,y,OSlime)) {
    ProcessAttackToSlime(SPlasma,SPlasmaHB); 
    if (animation_end())
    {
        hsp = 0;
        vsp = 0;
    }
    // Destroy the bullet instance
    instance_destroy();
}
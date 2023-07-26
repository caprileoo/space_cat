//Step Event

distanceTraveled += abs(speed * cos(degtorad(direction)));

for (var i = 0; i < array_length(collision_objects); i++) {
    if (place_meeting(x, y, collision_objects[i])) {
        collision = true;
        break;
    }
}

if (distanceTraveled >= 100 || collision) {
    kaboom();
}

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
//Step Event

distanceTraveled += abs(speed * cos(degtorad(direction)));

for (var i = 0; i < array_length(collision_objects); i++) {
    if (place_meeting(x + 1, y, collision_objects[i])) {
        collision = true;
        break;
    }
}

if (distanceTraveled >= 100 or collision) {
	speed = 0;
	sprite_index = SPlasmaExplode;
	if(animation_end()){
		instance_destroy();	
	}
}

if (place_meeting(x,y,ORanger)) {
	speed = 0;
    ProcessAttackToRMouse(SPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		instance_destroy();
    }
} else if (place_meeting(x,y,OFighter)){
	speed = 0;
    ProcessAttackToFMouse(SPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		instance_destroy();
    }
} else if (place_meeting(x,y,OSlime)) {
	speed = 0;
    ProcessAttackToSlime(SPlasmaExplode,SPlasmaHB); 
    if (animation_end())
    {
		instance_destroy();
    }
}
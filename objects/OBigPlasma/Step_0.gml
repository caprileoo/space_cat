//Step Event

distanceTraveled += abs(speed * cos(degtorad(direction)));

for (var i = 0; i < array_length(collision_objects); i++) {
    if (place_meeting(x, y, collision_objects[i])) {
        collision = true;
        break;
    }
}

if (place_meeting(x,y,ORanger)) {
	speed = 0;
    ProcessAttackToRMouse(SBigPlasmaExplode,SBigPlasmaHB);
} else if (place_meeting(x,y,OFighter)){
	speed = 0;
    ProcessAttackToFMouse(SBigPlasmaExplode,SBigPlasmaHB);
} else if (place_meeting(x,y,OSlime)) {
	speed = 0;
    ProcessAttackToSlime(SBigPlasmaExplode,SBigPlasmaHB); 
} else if(distanceTraveled > 100 or collision){
	speed = 0;
}

if(speed > 0){
	sprite_index = SBigPlasma;
} else {
	sprite_index = SBigPlasmaExplode;
	if(animation_end()){
		instance_destroy();
	}
}
distanceTraveled += abs(speed * cos(degtorad(direction)));

for (var i = 0; i < array_length(collision_objects); i++) {
    if (place_meeting(x, y, collision_objects[i])) {
        collision = true;
        break;
    }
}

if (distanceTraveled >= 100 || collision) {
	speed = 0;
	sprite_index = SBigPlasmaExplode;
	if(animation_end()){
		instance_destroy();	
	}
}

if (place_meeting(x,y,OCat)) {
	speed = 0;
    RangerProcessAttack(SBigPlasmaExplode,SPlasmaHB);
    if (animation_end())
    {
		instance_destroy();
    }
}
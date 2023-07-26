//Step Event

distanceTraveled += abs(speed * cos(degtorad(direction)));

for (var i = 0; i < array_length(collision_objects); i++) {
    if (place_meeting(x, y, collision_objects[i])) {
        collision = true;
        break;
    }
}

if (place_meeting(x,y,OCat)) {
	speed = 0;
    ProcessAttackToRMouse(SPlasmaExplode,SCheesePlasmaHB);
} else if(distanceTraveled > 100 or collision){
	speed = 0;
}

if(speed > 0){
	sprite_index = SCheesePlasma;
} else {
	sprite_index = SPlasmaExplode;
	if(animation_end()){
		instance_destroy();
	}
}
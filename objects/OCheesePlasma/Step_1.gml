distanceTraveled += abs(speed * cos(degtorad(direction)));

if (distanceTraveled >= 100) {
	distanceTraveled = 0;
    instance_destroy();
}

if (place_meeting(x,y,Owall) or place_meeting(x,y,OEdge)) instance_destroy();
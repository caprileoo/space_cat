distanceTraveled += abs(speed * cos(degtorad(direction)));

if (distanceTraveled >= 100 || place_meeting(x,y,Owall) || place_meeting(x,y,OEdge)) {
    kaboom();
}
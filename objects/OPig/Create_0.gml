hsp = 0;
vsp = 0;
grv = 0.3;

hitNow = false;
frameCount = 0;
state = ESTATE.FREE;
hp = 6;

enum ESTATE
{
	FREE,
	HIT,
	DEAD
}
image_index = irandom(10);
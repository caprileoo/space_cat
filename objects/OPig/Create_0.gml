hsp = 0;
vsp = 0;
grv = 0.3;
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
moveDuration = room_speed * 3; // 3 seconds


hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 6;
state = ESTATE.STATUS;

detectionRadius = 100;
target = instance_nearest(x, y, OKing);

enum ESTATE
{
	STATUS,
	FREE,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);
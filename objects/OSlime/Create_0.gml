hsp = 0;
vsp = 0;
grv = 0.3;
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
waitTimer = 0;
moveDuration = room_speed * 5; // 3 seconds
wait_free = room_speed * 2; //slime wait time b4 move
wait_chase = room_speed;


hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 6;
state = SSTATE.STATUS;

detectionRadius = 100;
target = instance_nearest(x, y, OKing);

enum SSTATE
{
	STATUS,
	FREE,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);
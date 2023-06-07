event_user(0);

hsp = 0;
vsp = 0; //vertical speed
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
moveDuration = room_speed * 1; // 3 seconds

//solve for grv dynamically
j_height = 30;
time_to_apex = 10;
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;

//Hit
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 20;
state = RSTATE.FREE;

detectionRadius = 100;
target = instance_nearest(x, y, OCat);
burst_count = 0;
burst_timer = 0;
fire_timer = 0;

enum RSTATE
{
	FREE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);

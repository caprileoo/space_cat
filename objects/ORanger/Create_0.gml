event_user(0);

//Movement
collision_objects = [Owall, OEdge];
hsp = 0;
vsp = 0; //vertical speed
moveDirection = 1; // -1 for left, 1 for right

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

//State Manager
state = RSTATE.WALK;
timer = 0;
pre_edge = false;

//Attack
detectionRadius = 100;
target = instance_nearest(x, y, OCat);
burst_count = 0;
burst_timer = 0;
fire_timer = 0;

enum RSTATE
{
	WALK,
	IDLE,
	TURN,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);

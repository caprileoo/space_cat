//Create Event

event_user(0);
hsp = 0;
vsp = 0; //vertical speed
max_vsp = 4;
timer = 0;
pre_edge = false;
moveDirection = 1; // -1 for left, 1 for right
collision_objects = [Owall, OEdge];

//Gravity Fall
j_height = 48;
time_to_apex = 18;
grv = (2 * j_height) / power(time_to_apex, 2);

//Hit
hitByAttack = ds_list_create();
hitByAttack2 = ds_list_create();

hitNow = false;
frameCount = 0;
hp = 20;
state = FSTATE.IDLE;

//Chase
detectionRadius = 100;
target = instance_nearest(x, y, OCat);

enum FSTATE
{
	IDLE,
	WALK,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);

//Create Event

event_user(0);

//Physics
hsp = 0;
vsp = 0;
pre_edge = false;
collision_objects = [Owall, OEdge];

//Gravity Fall
j_height = 48;
time_to_apex = 18;
grv = (2 * j_height) / power(time_to_apex, 2);

//Movement
timer = 0;
move_alarm = 0;
rest_alarm = 0;
moving_time = 10;
resting_time = 5;
moveDirection = 1; // -1 for left, 1 for right

//Stage Manager
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 10;
state = SSTATE.WALK;

//Attack
detectionRadius = 100;
target = instance_nearest(x, y, OCat);

enum SSTATE
{
	IDLE,
	WALK,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);

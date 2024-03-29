event_user(0);

//Array declare
collision_objects = [Owall, OEnemyEdge, OCheeseMain];
hit_wall_objects = [Owall];
turn_objects = [OEnemyEdge];

//Physics
hsp = 0;
vsp = 0; //vertical speed
timer = 0;
moveDirection = 1; // -1 for left, 1 for right
turnTimer = 0;

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
state = RSTATE.IDLE;

//Chase and Attack
attacking = false;
target = instance_nearest(x, y, OCat);
burst_count = 0;
burst_timer = 0;
fire_timer = 0;

enum RSTATE
{
	IDLE,
	WALK,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);

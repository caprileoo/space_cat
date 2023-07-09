event_user(0);
hascontrol = true;

//Array declare
collision_objects = [Owall, OEdge, OCheeseMain];
on_ground_objects = [Owall, OEdge, OCheeseMain];
hit_wall_objects = [Owall];
cheese_platforms = [OCheeseMain];

/**Physics**/
dir = 0;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
max_vsp = 4;
walksp = 2.75; //walking speed
accel_time = 6 // accelerate time in frame
deccel_time = 3 //deccelerate time in frame

//coyote time
can_jump_timer = 0;
coyote_time = 12;

//solve for grv dynamically (without grav_bender)
j_height = 58;
time_to_apex = 18;
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;
//fall_speed = 0; //for fall damage

//Player's States
state = PSTATE.IDLE;
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 100;

//state management
pre_move = false;
pre_idle = false;

//Plasma
plasma_timer = 0;
plasma_delay = 0;
plasma_fired = false;
plasma_charge_time = 0;
energy = 100;
max_energy = 100;
reload_time = 0;

//Attack
atk_timer = 0;

//Cheese platform
cheese_timer = 0;

enum PSTATE
{
    IDLE,
	WALK,
	RISING,
	FALLING,
	IDLE_CHARGE,
	WALK_CHARGE,
	RISING_CHARGE,
	FALLING_CHARGE,
	IDLE_RELEASE,
	WALK_RELEASE,
	RISING_RELEASE,
	FALLING_RELEASE,
    COMBO1,
	COMBO2,
	COMBO3,
	MELEE1,
	MELEE2,
	SLIME,
	RANGER,
    DEAD
}

image_index = irandom(10);
event_user(0);
hascontrol = true;

/**Physics**/
collision_objects = [Owall, OEdge];
dir = 0;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
max_vsp = 4;
walksp = 3.75; //walking speed
accel_time = 6 // accelerate time in frame
deccel_time = 3 //deccelerate time in frame

//coyote time
can_jump_timer = 0;
coyote_time = 12;

//solve for grv dynamically (without grav_bender)
j_height = 48;
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
plasma_charge_time = 0;
energy = 100;
max_energy = 100;
reload_time = 0;

enum PSTATE
{
    IDLE,
	WALK,
	RISING,
	FALLING,
    ATTACK_SLASH,
	CHARGE,
	RELEASE,
	MELEE1,
	MELEE2,
	SLIME,
	RANGER,
    DEAD
}

image_index = irandom(10);
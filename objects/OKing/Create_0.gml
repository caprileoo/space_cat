/**Physics**/
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
max_vsp = 4;
walksp = 0.5; //walking speed
max_walksp = 3; //maximum walking speed
j_height = 68;
time_to_apex = 28;
//solve for grv dynamically
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;

hascontrol = true;

//Player's States
state = PSTATE.FREE;
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 6;

enum PSTATE
{
    FREE,
    ATTACK_SLASH,
    HIT,
    DEAD
}

image_index = irandom(10);
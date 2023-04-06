/**Physics**/
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
grv = 0.15; //gravity
walksp = 2.5; //walking speed

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
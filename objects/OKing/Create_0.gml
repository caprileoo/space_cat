/**Physics**/
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
grv = 0.3; //gravity
walksp = 2.5; //walking speed
hp = 10;

hascontrol = true;

//Player States
state = PSTATE.FREE;
hitByAttack = ds_list_create();
	
enum PSTATE
{
	FREE,
	ATTACK_SLASH
}
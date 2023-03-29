/**Physics**/
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
grv = 0.3; //gravity
walksp = 4; //walking speed
hp = 6;

hascontrol = true;

state = PSTATE.FREE;
attack = false;
hitByAttack = ds_list_create();
	
enum PSTATE
{
	FREE,
	ATTACK_SLASH
}
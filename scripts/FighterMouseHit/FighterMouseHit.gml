// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FighterMouseHit(argument0){
	var _damage = argument0;

	hp -= _damage;
	if (hp > 0)
	{
		state = FSTATE.HIT;
		hitNow = true;
	}
	else
	{
		state = FSTATE.DEAD;
	}
}
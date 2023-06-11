function PlayerHitByMelee(argument0){
	
	var _damage = argument0;

	hp -= _damage;

	if (hp > 0)
	{
		state = PSTATE.HIT2;
		hitNow = true;
	}
	else
	{
		state = PSTATE.DEAD;
	}
}
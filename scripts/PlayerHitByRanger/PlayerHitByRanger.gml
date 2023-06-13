function PlayerHitByRanger(argument0) {
	
	var _damage = argument0;

	hp -= _damage;
	
	if (hp > 0)
	{
		state = PSTATE.RANGER;
		hitNow = true;
	}
	else
	{
		state = PSTATE.DEAD;
	}
}
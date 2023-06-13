function PlayerHitBySlime(argument0){
	
	var _damage = argument0;

	hp -= _damage;

	if (hp > 0)
	{
		state = PSTATE.SLIME;
		hitNow = true;
	}
	else
	{
		state = PSTATE.DEAD;
	}
}
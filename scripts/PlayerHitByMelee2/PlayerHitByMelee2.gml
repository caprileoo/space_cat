function PlayerHitByMelee2(argument0){
	
	var _damage = argument0;

	hp -= _damage;

	if (hp > 0)
	{
		state = PSTATE.MELEE2;
		hitNow = true;
	}
}
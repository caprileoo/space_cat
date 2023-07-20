function PlayerHitByMelee1(argument0){
	
	var _damage = argument0;

	hp -= _damage;

	if (hp > 0)
	{
		state = PSTATE.MELEE1;
		hitNow = true;
	}

}
function EnemyHit(argument0) {
	var _damage = argument0;

	hp -= _damage;
	if (hp > 0)
	{
		state = RSTATE.HIT;
		hitNow = true;
	}
	else
	{
		state = RSTATE.DEAD;
	}
}

function SlimeHit(argument0){
	var _damage = argument0;

	hp -= _damage;
	if (hp > 0)
	{
		state = SSTATE.HIT;
		hitNow = true;
	}
}
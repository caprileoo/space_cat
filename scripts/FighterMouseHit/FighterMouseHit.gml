function FighterMouseHit(argument0){
	var _damage = argument0;

	hp -= _damage;
	if (hp > 0)
	{
		state = FSTATE.HIT;
		hitNow = true;
	}
}
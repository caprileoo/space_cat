function PState_Atk_Slash(){
	hsp = 0;
	vsp = 0;

	ProcessAttack(SKingAtk,SKingAtkHB);

	if (animation_end())
	{
		sprite_index = sKing;
		state = PSTATE.FREE;
	}
}
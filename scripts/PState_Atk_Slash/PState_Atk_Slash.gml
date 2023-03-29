function PState_Atk_Slash(){
	ProcessAttack(SKingAtk,SKingAtkHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sKing;
		state = PSTATE.FREE;
	}
}
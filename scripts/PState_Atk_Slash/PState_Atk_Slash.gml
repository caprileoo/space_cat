function PState_Atk_Slash(){
	ProcessAttack(SCatSlash,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sKing;
		state = PSTATE.FREE;
	}
}
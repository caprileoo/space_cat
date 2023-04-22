function PState_Atk_Slash(){
	ProcessAttackToSlime(SCatSlash,SCatSlashHB);
	ProcessAttackToMouse(SCatSlash, SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sKing;
		state = PSTATE.FREE;
	}
}
function PState_Atk_Slash(){
	ProcessAttackToSlime(SCatSlash,SCatSlashHB);
	ProcessAttackToFMouse(SCatSlash, SCatSlashHB);
	ProcessAttackToRMouse(SCatSlash, SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sCat;
		state = PSTATE.IDLE;
	}
}
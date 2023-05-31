function PState_Atk_Slash(){
	ProcessAttackToSlime(SCatSlash,SCatSlashHB);
	ProcessAttackToFMouse(SCatSlash, SCatSlashHB);
	ProcessAttackToRMouse(SCatSlash, SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		image_index = 0;
		state = PSTATE.IDLE;
	}
}
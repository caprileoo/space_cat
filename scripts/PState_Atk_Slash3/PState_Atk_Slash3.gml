function PState_Atk_Slash3(){
	ProcessAttackToSlime(SCatSlashEnd,SCatSlashHB3);
	ProcessAttackToFMouse(SCatSlashEnd, SCatSlashHB3);
	ProcessAttackToRMouse(SCatSlashEnd, SCatSlashHB3);
	
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sCat;
		state = PSTATE.IDLE;
	}
}
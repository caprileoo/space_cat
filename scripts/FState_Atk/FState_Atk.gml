function FState_Atk(){
	FighterProcessAttack(SPigAtk,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = SFMouseIdle;
		state = FSTATE.STATUS;
	}
}
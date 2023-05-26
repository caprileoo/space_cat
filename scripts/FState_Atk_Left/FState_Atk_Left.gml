function FState_Atk_Left(){
	FighterProcessAttack(SFMouseAtkLeft,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = SFMouseAtkRight;
		state = FSTATE.RIGHTATK;
	}
}
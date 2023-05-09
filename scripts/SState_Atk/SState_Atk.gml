function SState_Atk(){
	SlimeProcessAttack(SSlimeAtk,SSlimeHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = SSlimeIdle;
		state = SSTATE.STATUS;
	}
}
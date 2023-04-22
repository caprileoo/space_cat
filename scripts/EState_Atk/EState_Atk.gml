function EState_Atk(){
	MouseProcessAttack(SPigAtk,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = SPigIdle;
		state = ESTATE.STATUS;
	}
}
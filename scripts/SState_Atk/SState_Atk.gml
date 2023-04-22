function SState_Atk(){
	show_debug_message("Attack");
	SlimeProcessAttack(SPigAtk,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = SSlimeIdle;
		state = SSTATE.STATUS;
	}
}
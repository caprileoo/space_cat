function SState_Atk(){
	show_debug_message("Attack");
	EnemyProcessAttack(SPigAtk,SCatSlashHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = OPig;
		state = SSTATE.STATUS;
	}
}
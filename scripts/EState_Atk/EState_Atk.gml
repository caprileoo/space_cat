function EState_Atk(){
	show_debug_message("Attack");
	EnemyProcessAttack(SKingAtk,SKingAtkHB);
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = OPig;
		state = ESTATE.STATUS;
	}
}
function SState_Atk(){
	show_debug_message("Attacking!");
	SlimeProcessAttack(SSlimeAtk,SSlimeHB);
	if (animation_end())
	{
		show_debug_message("Done Attacking!");
		hsp = 0;
		vsp = 0;
		sprite_index = SSlimeIdle;
		state = SSTATE.STATUS;
	}
}
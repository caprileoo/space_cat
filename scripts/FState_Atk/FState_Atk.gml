function FState_Atk(){
	attacking = true;
	
	FighterProcessAttack(SFMouseAtk,SFighterHB, SFighterHBCombo);
	
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		attacking = false;
		sprite_index = SFMouseRun;
		state = FSTATE.CHASE;
	}
	
	move_n_collide(collision_objects);
}
function FState_Atk(){
	vsp += grv;
	
	FighterProcessAttack(SFMouseAtk,SFighterHB, SFighterHBCombo);
	
	if (animation_end())
	{
		hsp = 0;
		sprite_index = SFMouseRun;
		state = FSTATE.CHASE;
	}
	
	move_n_collide(collision_objects);
}
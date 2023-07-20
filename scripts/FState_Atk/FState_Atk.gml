function FState_Atk(){
	image_speed = 2;
	attacking = true;
	FighterProcessAttack(SFMouseAtk,SFighterHB, SFighterHBCombo);
	
	if (animation_end())
	{
		attacking = false;
		hsp = 0;
		vsp = 0;
	}
	
	move_n_collide(collision_objects);
}
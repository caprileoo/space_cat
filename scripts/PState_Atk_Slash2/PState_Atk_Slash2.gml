function PState_Atk_Slash2(){
	
	ProcessAttackToSlime(SCatSlash2,SCatSlashHB2);
	ProcessAttackToFMouse(SCatSlash2, SCatSlashHB2);
	ProcessAttackToRMouse(SCatSlash2, SCatSlashHB2);

	// Check the timer before transitioning to the next combo state
	if(key_atk and on_ground() and image_index > 2 and atk_timer >= 1) {
	    state = PSTATE.COMBO3;
	    atk_timer = 0;
	}
	
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sCat;
		state = PSTATE.IDLE;
	}
}
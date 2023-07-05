function PState_Atk_Slash1(){
	
	ProcessAttackToSlime(SCatSlash1,SCatSlashHB1);
	ProcessAttackToFMouse(SCatSlash1, SCatSlashHB1);
	ProcessAttackToRMouse(SCatSlash1, SCatSlashHB1);

	// Check the timer before transitioning to the next combo state
	if(key_atk and on_ground() and image_index > 2 and atk_timer >= 1) {
	    state = PSTATE.COMBO2;
	}
	
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sCat;
		state = PSTATE.IDLE;
	}
}
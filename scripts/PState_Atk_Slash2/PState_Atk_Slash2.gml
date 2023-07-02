function PState_Atk_Slash2(){
	ProcessAttackToSlime(SCatSlash2,SCatSlashHB2);
	ProcessAttackToFMouse(SCatSlash2, SCatSlashHB2);
	ProcessAttackToRMouse(SCatSlash2, SCatSlashHB2);
	
	if(key_atk and on_ground() and image_index > 1) {
		state = PSTATE.COMBO3;
	}
	
	if (animation_end())
	{
		hsp = 0;
		vsp = 0;
		sprite_index = sCat;
		state = PSTATE.IDLE;
	}
}
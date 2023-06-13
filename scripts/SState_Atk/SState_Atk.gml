function SState_Atk(){
	attacking = true;
	
	SlimeProcessAttack(SSlimeAtk,SSlimeHB);
	if (animation_end())
	{
		attacking = false;
		hsp = 0;
		vsp = 0;
	}
	
	move_n_collide(collision_objects);
}
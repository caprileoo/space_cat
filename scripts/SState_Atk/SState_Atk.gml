function SState_Atk(){
	vsp += grv;
	
	SlimeProcessAttack(SSlimeAtk,SSlimeHB);
	if (animation_end())
	{
		hsp = 0;
		sprite_index = SSlimeIdle;
	}
	
	move_n_collide(collision_objects);
}
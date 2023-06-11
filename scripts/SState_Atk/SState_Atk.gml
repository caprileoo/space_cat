function SState_Atk(){
	vsp += grv;
	
	SlimeProcessAttack(SSlimeAtk,SSlimeHB);
	if (animation_end())
	{
		sprite_index = SSlimeIdle;
	}
	
	move_n_collide(collision_objects);
}
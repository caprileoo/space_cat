function FState_Dead(){
	if (sprite_index != SFMouseDed)
	{
		sprite_index = SFMouseDed;
		image_index = 0;
	}

	if (animation_end()) instance_change(OFMouseCorpse, true);

}
function FState_Dead(){
	if (sprite_index != SPigDed)
	{
		sprite_index = SPigDed;
		image_index = 0;
	}

	if (animation_end()) instance_change(OFMouseCorpse, true);

}
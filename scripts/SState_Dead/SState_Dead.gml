function SState_Dead() {
	if (sprite_index != SSlimeDed)
	{
		sprite_index = SSlimeDed;
		image_index = 0;
	}

	if (animation_end()) instance_change(OSlimeCorpse, true);

}
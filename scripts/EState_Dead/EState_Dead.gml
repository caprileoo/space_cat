function EState_Dead() {
	if (sprite_index != SSlimeDed_test)
	{
		sprite_index = SSlimeDed_test;
		image_index = 0;
	}

	if (animation_end()) instance_change(OSlimeCorpse, true);

}
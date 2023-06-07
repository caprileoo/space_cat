function RState_Dead() {
	if (sprite_index != SRMouseDed)
	{
		sprite_index = SRMouseDed;
		image_index = 0;
	}

	if (animation_end()) instance_change(ORMouseCorpse, true);
}
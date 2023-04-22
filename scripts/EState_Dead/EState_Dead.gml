function EState_Dead() {
	if (sprite_index != SPigDed)
	{
		sprite_index = SPigDed;
		image_index = 0;
	}

	if (animation_end()) sprite_index = SPigDed;

}
function PState_Dead(){
	if (sprite_index != SCatDed)
	{
		sprite_index = SCatDed;
		image_index = 0;
	}

	if (animation_end()) room_restart();
}
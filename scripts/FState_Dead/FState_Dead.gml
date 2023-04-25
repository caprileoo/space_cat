// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FState_Dead(){
	if (sprite_index != SPigDed)
	{
		sprite_index = SPigDed;
		image_index = 0;
	}

	if (animation_end()) sprite_index = SPigDed;

}
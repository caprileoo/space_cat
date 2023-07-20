if (place_meeting(x, y - 1, OCat)) {
	
	if (object_index == OCheesePlatform1) {
        sprite_index = SCheesePlatSmall_Disappear;
    } else if (object_index == OCheesePlatform2) {
        sprite_index = SCheesePlatSmall_Disappear;
    }
	
    if (++timer >= room_speed * 3) {
        instance_destroy();
    }
}
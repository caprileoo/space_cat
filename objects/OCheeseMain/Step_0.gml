if (place_meeting(x, y - 1, OCat)) {
    if (++timer >= room_speed * 2) {
        instance_destroy();
    }
}





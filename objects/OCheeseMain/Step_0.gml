// Declare a variable to store the previous image index

if (place_meeting(x, y - 1, OCat)) {
    if (object_index == OCheesePlatform1) {
        sprite_index = SCheesePlatSmall_Disappear;
    } else if (object_index == OCheesePlatform2) {
        sprite_index = SCheesePlatSmall_Disappear;
    }
    
    // Update the image index based on the timer
    image_index = floor(timer / (room_speed * 2) * 7);
    
    // Store the current image index
    prev_image_index = image_index;
    
    if (++timer >= room_speed * 2) {
        instance_destroy();
    }
} else {
    // Restore the previous image index
    image_index = prev_image_index;
}

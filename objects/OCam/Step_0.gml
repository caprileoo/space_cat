// Step Event
x += (player.x - x) * smoothness;
y += (player.y - y) * smoothness;

if (keyboard_check(ord("O"))) {
    zoom += 0.01;
}

if (keyboard_check(ord("P"))) {
    zoom -= 0.01;
}

zoom = clamp(zoom, 0.5, 2);

camera_set_view_size(view_camera[0], cam_width * zoom, cam_height * zoom);

// Edge snapping
var cam_x = x - cam_width * zoom / 2;
var cam_y = y - cam_height * zoom / 2;

cam_x = clamp(cam_x, 0, room_width - cam_width * zoom);
cam_y = clamp(cam_y, 0, room_height - cam_height * zoom);

camera_set_view_pos(view_camera[0], cam_x, cam_y);

//if(layer_exists("custom")){
//	var custom1 = layer_get_id("custom");
//}

//layer_x(custom1, x/50);
//layer_y(custom1, y/50);

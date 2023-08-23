// Create Event
player = instance_find(OCat, 0);

cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

x = player.x;
y = player.y;

zoom = 1; // Set the initial zoom value to 1
zoom_out = false; // Set the initial zoom_out value to false

smoothness = 0.07;
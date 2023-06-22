//target = OCat;

//cam_width = camera_get_view_width(view_camera[0]);
//cam_height = camera_get_view_height(view_camera[0]);

//xTo = xstart;
//yTo = ystart;

camWidth = 320;
camHeight = 190;
surface_resize(application_surface, camWidth + 1, camHeight + 1);
application_surface_draw_enable(false);

follow = OCat;

xTo = x;
yTo = y;


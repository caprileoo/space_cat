#region Move View

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);
#endregion
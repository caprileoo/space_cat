//Update destination
if not (instance_exists(target)) exit;

x = lerp(x, target.x, 0.1);
y = lerp(y, target.y - cam_height/6, 0.05); //last value for how sensitive the cam will move vertically

camera_set_view_pos(view_camera[0], x - cam_width/2, y - cam_height/2);


//Draft

//if(follow != noone){
//	xTo = follow.x;
//	yTo = follow.y;
//}

//x += (xTo - x) / 25;
//y += (yTo - y) / 25;

//camera_set_view_pos(
//	view_camera[0],
//	floor(x - (camWidth * 0.5)),
//	floor(y - (camHeight * 0.5))
//);

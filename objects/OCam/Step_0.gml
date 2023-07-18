//Update destination
if not (instance_exists(target)) exit;

x = lerp(x, target.x, 0.1);
y = lerp(y, target.y - cam_height/6, 0.05); //last value for how sensitive the cam will move vertically

camera_set_view_pos(view_camera[0], x - cam_width/2, y - cam_height/2);

if(layer_exists("Background_1_2")){
	var background_1_2 = layer_get_id("Background_1_2");
}
if(layer_exists("Background_1_2_1")){
	var background_1_2_1 = layer_get_id("Background_1_2_1");
}
if(layer_exists("Background_1")){
	var background_1 = layer_get_id("Background_1");
}
if(layer_exists("Background_1_1")){
	var background_1_1 = layer_get_id("Background_1_1");
}
if(layer_exists("Background")){
	var background = layer_get_id("Background");
}

layer_x(background_1_2, x/10);
layer_x(background_1_2_1, x/20);
layer_x(background_1, x/30);
layer_x(background_1_1, x/40);
layer_x(background, x/50);



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

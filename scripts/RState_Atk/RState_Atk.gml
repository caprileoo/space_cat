function RState_Atk(){
	var bullet;
	for(var i = 0; i< 3; i++){
		bullet = instance_create_layer(x,y,"Instances",ORangerBullet);
		get_dir();
		bullet.direction = dir;
		bullet.speed = 5;
		alarm[0] = room_speed * 2;
		state = RSTATE.WAIT;
	}
}
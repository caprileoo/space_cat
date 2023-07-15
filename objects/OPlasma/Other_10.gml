function kaboom(){
	speed = 0;
	sprite_index = SPlasmaExplode;
	if(animation_end()){
		instance_destroy();	
	}
}


